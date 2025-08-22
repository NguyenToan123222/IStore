//
//  Auth.swift
//  IStore
//
//  Created by Nguyễn Toàn on 21/8/25.
//

import Foundation

@Observable
class AuthVM {
    var isValidLogin: Bool = false
    
    var passwordValidStateLogin: ValidateState = .empty
    var emailValidStateLogon: ValidateState = .empty
    
    var emailLogin = "" {
        didSet {
            emailValidStateLogon = emailLogin.isEmpty ? .empty : (isValidEmail(emailLogin) ? .valid : .invalid)
        }
    }
    var passwordLogin = "" {
        didSet {
            passwordValidStateLogin
        }
    }
}
