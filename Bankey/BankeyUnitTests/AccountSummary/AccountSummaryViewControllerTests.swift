//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Bugra Ates on 9/16/22.
//

import Foundation
import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            guard let profile = profile else {return}
            completion(.success(profile))
        }
    }
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        // vc.loadViewIfNeeded()
        
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual(titleAndMessage.0, "Server Error")
        XCTAssertEqual(titleAndMessage.1, "Ensure you are connected to the internet. Please try again.")
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual(titleAndMessage.0, "Decoding Error")
        XCTAssertEqual(titleAndMessage.1, "We could not process your request. Please try again.")
    }
    
    func testAlertForServerError() throws {
        
        // It is the manager of the vc now
        mockManager.error = .serverError
        
        // This will trigger the mock fetchProfile method of MockManager
        // insted of fetchProfile method of original ProfileManager
        vc.forceFetchProfile()
        
        XCTAssertEqual(vc.errorAlert.title, "Server Error")
        XCTAssertEqual(vc.errorAlert.message, "Ensure you are connected to the internet. Please try again.")
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = .decodingError
        
        vc.forceFetchProfile()
        
        XCTAssertEqual(vc.errorAlert.title, "Decoding Error")
        XCTAssertEqual(vc.errorAlert.message, "We could not process your request. Please try again.")
    }
}
