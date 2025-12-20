//
//  User.swift
//  IStore
//
//  Created by Nguyễn Toàn on 27/8/25.
//

import Foundation


struct RegisterRequest: Codable {
    let email: String
    let password: String
    let name: String
}

struct ValidateResponse: Decodable {
    let message: String? 
}


struct ValidateRequest: Codable {
    let code: String
}


struct LoginResponse: Codable {
    let message: String
    let admin: Bool
}

struct LoginRequest: Codable {
    let password: String
    let email: String
}

struct ForgotPasswordResponse: Codable {
    let email: String
}
