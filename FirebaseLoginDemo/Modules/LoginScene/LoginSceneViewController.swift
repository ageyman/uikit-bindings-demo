//
//  ViewController.swift
//  FirebaseLoginDemo
//
//  Created by Aleksandar Geyman on 7.12.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import UIKit
import TwoWayBondage

protocol LoginSceneViewModelProtocol: class {
    var emailTextFieldViewModel: LoginTextFieldViewModelProtocol {get}
    var passwordTextFieldViewModel: LoginTextFieldViewModelProtocol {get}
    var isLoginButtonEnabled: Observable<Bool> {get}
}

class LoginSceneViewController: UIViewController {
    @IBOutlet private weak var emailTextField: LoginTextFieldView! {
        didSet {
            emailTextField.configureWith(viewModel.emailTextFieldViewModel)
        }
    }
    @IBOutlet private weak var passwordTextField: LoginTextFieldView! {
        didSet {
            passwordTextField.configureWith(viewModel.passwordTextFieldViewModel)
        }
    }
    @IBOutlet weak var loginButton: UIButton!

    private var viewModel: LoginSceneViewModelProtocol = LoginSceneViewModel(emailTextFieldViewModel: LoginTextFieldViewModel(isTextFieldEmpty: Observable<Bool>(true),
                                                                                                                              isSecured: false,
                                                                                                                              placeholderText: "email"),
                                                                             passwordTextFieldViewModel: LoginTextFieldViewModel(isTextFieldEmpty: Observable<Bool>(true),
                                                                                                                                 isSecured: true,
                                                                                                                                 placeholderText: "password"))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindingsWith(viewModel)
    }

    private func setupBindingsWith(_ viewModel: LoginSceneViewModelProtocol) {
        viewModel.isLoginButtonEnabled.bindAndFire { [weak self] isEnabled in
            guard let strongSelf = self else { return }

            strongSelf.configureButton(button: strongSelf.loginButton, isEnabled: isEnabled)
        }
    }

    private func configureButton(button: UIButton, isEnabled: Bool) {
        button.isEnabled = isEnabled
        button.backgroundColor = isEnabled ? .systemBlue : .lightGray
    }
}
