//
//  LoginTextFieldView.swift
//  FirebaseLoginDemo
//
//  Created by Aleksandar Geyman on 8.12.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import TwoWayBondage

protocol LoginTextFieldViewModelProtocol: class {
    var isTextFieldEmpty: Observable<Bool> {get}
    var isSecured: Bool {get}
    var placeholderText: String {get}
}

class LoginTextFieldView: BaseView {
    @IBOutlet private weak var loginTextField: UITextField! {
        didSet {
            loginTextField.delegate = self
        }
    }
    
    private var isTextFieldEmpty: Observable<Bool>? = nil

    func configureWith(_ viewModel: LoginTextFieldViewModelProtocol) {
        self.isTextFieldEmpty = viewModel.isTextFieldEmpty
        loginTextField.isSecureTextEntry = viewModel.isSecured
        loginTextField.placeholder = viewModel.placeholderText
    }
}

extension LoginTextFieldView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        isTextFieldEmpty?.value = textField.text?.isEmpty
    }
}
