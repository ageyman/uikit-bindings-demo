//
//  LoginSceneViewModel.swift
//  FirebaseLoginDemo
//
//  Created by Aleksandar Geyman on 8.12.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation
import TwoWayBondage

class LoginSceneViewModel: LoginSceneViewModelProtocol {
    let emailTextFieldViewModel: LoginTextFieldViewModelProtocol
    let passwordTextFieldViewModel: LoginTextFieldViewModelProtocol
    let isLoginButtonEnabled = Observable<Bool>(false)
    private var isEmailTextFieldEmpty = true
    private var isPasswordTextFieldEmpty = true

    init(emailTextFieldViewModel: LoginTextFieldViewModelProtocol,
         passwordTextFieldViewModel: LoginTextFieldViewModelProtocol ) {
        self.emailTextFieldViewModel = emailTextFieldViewModel
        self.passwordTextFieldViewModel = passwordTextFieldViewModel
        setupBindings()
    }
    
    private func setupBindings() {
        emailTextFieldViewModel.isTextFieldEmpty.bindAndFire { [unowned self] isEmpty in
            self.isEmailTextFieldEmpty = isEmpty
            self.updateLoginButtonState()
        }

        passwordTextFieldViewModel.isTextFieldEmpty.bindAndFire { [unowned self] isEmpty in
            self.isPasswordTextFieldEmpty = isEmpty
            self.updateLoginButtonState()
        }
    }

    private func updateLoginButtonState() {
        let shouldEnable = (!isEmailTextFieldEmpty && !isPasswordTextFieldEmpty) ? true : false
        isLoginButtonEnabled.value = shouldEnable
    }
}
