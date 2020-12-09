//
//  LoginTextFieldViewModel.swift
//  FirebaseLoginDemo
//
//  Created by Aleksandar Geyman on 8.12.20.
//  Copyright © 2020 Aleksandar Geyman. All rights reserved.
//

import Foundation
import TwoWayBondage

class LoginTextFieldViewModel: LoginTextFieldViewModelProtocol {
    let isTextFieldEmpty: Observable<Bool>
    let isSecured: Bool
    let placeholderText: String

    init(isTextFieldEmpty: Observable<Bool>, isSecured: Bool, placeholderText: String) {
        self.isTextFieldEmpty = isTextFieldEmpty
        self.isSecured = isSecured
        self.placeholderText = placeholderText
    }
}
