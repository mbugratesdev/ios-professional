//
//  ViewController.swift
//  UITextFieldDemo
//
//  Created by Bugra Ates on 9/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    private func style() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter some text here"
        textField.delegate = self
        textField.backgroundColor = .systemGray6
        
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
    
    private func layout() {
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 2)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    @objc private func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text ?? "")
    }
}
