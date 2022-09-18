//
//  ViewController.swift
//  Password
//
//  Created by Bugra Ates on 9/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        // Stack
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Status View
        statusView.layer.cornerRadius = 5
        statusView.clipsToBounds = true
        
        // Button
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Reset password", for: [])
        resetButton.configuration = .filled()
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        // Stack view
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
