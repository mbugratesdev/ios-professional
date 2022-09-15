//
//  AccountTests.swift
//  BankeyUnitTests
//
//  Created by Bugra Ates on 9/15/22.
//

import Foundation
import XCTest

@testable import Bankey

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """

        // Game on here 🕹
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let data = json.data(using: .utf8)!
        let accounts = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(accounts.count, 2)
        
        let account = accounts[0]
        
        XCTAssertEqual(account.id, "1")
        XCTAssertEqual(account.type, .Banking)
        XCTAssertEqual(account.amount, 929466.23)
        XCTAssertEqual(account.name, "Basic Savings")
        XCTAssertEqual(account.createdDateTime.monthDayYearString, "Haz 21, 2010")
        
    }
}
