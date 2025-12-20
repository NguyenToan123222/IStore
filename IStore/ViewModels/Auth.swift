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
    var isvalidRegister: Bool = false
    var isvalidForget: Bool = false
    var isvalidCode: Bool = false
    var isLogged: Bool = false
    var acceptedCode: Bool = false
    var isValidatedReset: Bool = false

    
    var passwordValidStateLogin: ValidateState = .empty
    var emailValidStateLogin: ValidateState = .empty
    
    var passwordValidStateRegister: ValidateState = .empty
    var emailValidStateRegister: ValidateState = .empty
    
    var emailValidStateForget: ValidateState = .empty
    var passwordValidStateForget: ValidateState = .empty
    
    var nameValidRegister : ValidateState = .empty
    var nameValidStateRegister: ValidateState = .empty
    
    var resetEmailValidState: ValidateState = .empty
    var resetPasswordValidState: ValidateState = .empty

    
    var codeValidStateRegister: ValidateState = .empty
    
    var showRegister: Bool = false
    var showForgot: Bool = false

    
    var alertTitle = ""
    var alertMessage = ""
    var showALert: Bool = false
    
    
    var emailLogin = "" {
        didSet {
            emailValidStateLogin = emailLogin.isEmpty ? .empty : (isValidEmail(emailLogin) ? .valid : .invalid)
            updateValidLogin()
        }
    }
    var emailRegister = "" {
        didSet {
            emailValidStateLogin = emailRegister.isEmpty ? .empty : (isValidEmail(emailRegister) ? .valid : .invalid)
            updateValidLogin()
        }
    }
    var emailForget = "" {
        didSet {
            emailValidStateForget = emailForget.isEmpty ? .empty : (isValidEmail(emailForget) ? .valid : .invalid)
            updateValidForget()
        }
    }
    
    var passwordLogin = "" {
        didSet {
            passwordValidStateLogin = passwordLogin.isEmpty ? .empty : (passwordLogin.count <= 4 ? .valid : .invalid)
            updateValidLogin()
        }
    }
    var passwordRegister = "" {
        didSet {
            passwordValidStateRegister = passwordRegister.isEmpty ? .empty : (passwordRegister.count <= 4 ? .valid : .invalid)
            updateValidRegister()
        }
    }
    var nameRegister = "" {
        didSet {
            nameValidRegister = emailRegister.isEmpty ? .empty : (nameRegister.count <= 4 ? .invalid : .valid)
            updateValidRegister()
        }
    }
    var resetEmail = "" {
        didSet {
            resetEmailValidState = resetEmail.isEmpty ? .empty : (isValidEmail(resetEmail) ? .valid : .invalid)
            updateResetValidation()
        }
    }
    var resetPassword = "" {
        didSet {
            resetPasswordValidState = resetPassword.isEmpty ? .empty : (resetPassword.count <= 5 ? .invalid : .valid)
            updateResetValidation()
        }
    }
    var forgetCode: String = "" {
        didSet {
            resetPasswordValidState = forgetCode.isEmpty ? .empty : (forgetCode.count <= 5 ? .invalid : .valid)
            updateValidCode()
        }
    }
    func updateValidLogin() {
        isValidLogin = emailValidStateLogin == .valid && passwordValidStateLogin == .valid
    }
    func updateValidRegister() {
        isvalidRegister = emailValidStateRegister == .valid && passwordValidStateRegister == .valid && nameValidStateRegister == .valid
    }
    func updateValidForget() {
        isvalidForget = emailValidStateForget == .valid 
    }
    func updateValidCode() {
        isvalidCode = codeValidStateRegister == .valid
    }
    
    func updateResetValidation() {
        isValidatedReset = (resetPasswordValidState == .valid) && (resetPasswordValidState == .valid)
    }
    
    func register(name: String, email: String, password: String) async throws -> ValidateResponse {
        guard let url = URLComponents(string: "\(baseURL)/register")?.url else {
            return ValidateResponse(message: "URL Incorrect")
        }
        let registerRequest = RegisterRequest(email: email, password: password, name: name)
        
        var requestBody : Data
        
        do {
            requestBody = try JSONEncoder().encode(registerRequest)
            //registerRequest: {"email": "toan@example.com", "password": "1234", "name": "Toan"} .
        } catch {
            throw NetworkError.invalidData
        }
        do {
            let (authReponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            /*
             httpRequest ->
                    authReponse = ValidateResponse(message: "Success"),
                    httpResponse.statusCode = 200.
             */
            
            if (200...299).contains(httpResponse.statusCode) {
                alertTitle = "Success"
                alertMessage = authReponse.message ?? ""
                showALert = true
                return ValidateResponse(message: authReponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authReponse.message ?? ""
                showALert = true
                print(name, email, password)
                throw NetworkError.invalidResponse
            }
        } catch {
            alertTitle = ""
            alertMessage = "Network Request Failed"
            showALert = true
            throw NetworkError.invalidResponse
        }
    }
    
    func validate(code: String) async throws -> ValidateResponse {
        guard let url = URLComponents(string: "\(baseURL)/validate")?.url else {
            print("Invalid URL: \(baseURL)/register")
            return ValidateResponse(message: "URL Incorrect")
        }
        let validateRequest = ValidateRequest(code: code )
        
        var requestBody : Data
        
        do {
            requestBody = try JSONEncoder().encode(validateRequest)

        } catch {
            throw NetworkError.invalidData
        }
        do {
            let (authReponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                alertTitle = "Success"
                alertMessage = authReponse.message ?? ""
                showALert = true
                acceptedCode = true
                return ValidateResponse(message: authReponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authReponse.message ?? ""
                showALert = true
                //throw NetworkError.invalidResponse
                return ValidateResponse(message: authReponse.message)

            }
        } catch {
            alertTitle = ""
            alertMessage = "Network Request Failed"
            showALert = true
            //throw NetworkError.invalidResponse
            return ValidateResponse(message: alertMessage)

        }
    }
    func login(email: String, password: String) async throws -> LoginResponse {
        guard let url = URLComponents(string: "\(baseURL)/login")?.url else {
            print("Invalid URL: \(baseURL)/login")
            return LoginResponse(message: "Problem with URL", admin: false)
        }
        let loginRequest = LoginRequest(password: password, email: email)
        let requestBody: Data
        
        do {
            requestBody = try JSONEncoder().encode(loginRequest)
            print(requestBody)
        } catch {
            throw NetworkError.invalidData
        }
        
        do {
            let(authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (LoginResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                if let cookies = HTTPCookieStorage.shared.cookies(for: url) {
                    for cookie in cookies {
                        if cookie.name == "token" {
                            KeychainService.saveToken(token: cookie.value)
                            break
                        }
                    }
                }
                isLogged = true
                alertTitle = "Success"
                alertMessage = authResponse.message
                showRegister = true
                return LoginResponse(message: authResponse.message, admin: authResponse.admin)
            }else {
                alertTitle = "Error"
                alertMessage = authResponse.message
                showRegister = true
                return LoginResponse(message: authResponse.message, admin: authResponse.admin)
            }
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Network Request Failed"
            showALert = true
            throw NetworkError.invalidResponse
        }
    }
    
    func resetPassword(email: String, password: String) async throws -> ValidateResponse {
        guard let url = URLComponents(string: "\(baseURL)/login")?.url else {
            print("Invalid URL: \(baseURL)/login")
            return ValidateResponse(message: "Problem with URL")
        }
        let loginRequest = LoginRequest(password: password, email: email)
        let requestBody: Data
        
        do {
            requestBody = try JSONEncoder().encode(loginRequest)
            print(requestBody)
        } catch {
            throw NetworkError.invalidData
        }
        
        do {
            let(authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                isLogged = true
                alertTitle = "Success"
                alertMessage = authResponse.message ?? ""
                showRegister = true
                return ValidateResponse(message: authResponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authResponse.message ?? ""
                showRegister = true
                return ValidateResponse(message: authResponse.message)
            }
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Network Request Failed"
            showALert = true
            return ValidateResponse(message: alertMessage)
        }
    }
    
    func validateReset(code: String) async throws -> ValidateResponse {
        guard let url = URLComponents(string: "\(baseURL)/validateResetCode")?.url else {
            print("Invalid URL: \(baseURL)/changePassword")
            return ValidateResponse(message: "Problem with URL")
        }
        let resetRequest = ValidateRequest(code: code)
        let requestBody: Data
        
        do {
            requestBody = try JSONEncoder().encode(resetRequest)
            print(requestBody)
        } catch {
            throw NetworkError.invalidData
        }
        
        do {
            let(authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                alertTitle = "Success"
                alertMessage = authResponse.message ?? ""
                // showALert = true
                acceptedCode = true
                return ValidateResponse(message: authResponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authResponse.message ?? ""
                showRegister = true
                return ValidateResponse(message: authResponse.message)
            }
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Network Request Failed"
            showALert = true
            return ValidateResponse(message: alertMessage)
        }
    }
    
    
    func forgotPassword(email: String) async throws -> ValidateResponse {
        guard let url = URLComponents(string: "\(baseURL)/validateResetCode")?.url else {
            print("Invalid URL: \(baseURL)/changePassword")
            return ValidateResponse(message: "Problem with URL")
        }
        let resetRequest = ForgotPasswordResponse(email: email)
        let requestBody: Data
        
        do {
            requestBody = try JSONEncoder().encode(resetRequest)
            print(requestBody)
        } catch {
            throw NetworkError.invalidData
        }
        
        do {
            let(authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST, body: requestBody) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode) {
                alertTitle = "Success"
                alertMessage = authResponse.message ?? ""
                showALert = true
                acceptedCode = true
                return ValidateResponse(message: authResponse.message)
            } else {
                alertTitle = "Error"
                alertMessage = authResponse.message ?? ""
                showRegister = true
                return ValidateResponse(message: authResponse.message)
            }
        }
        catch {
            alertTitle = "Error"
            alertMessage = "Network Request Failed"
            showALert = true
            return ValidateResponse(message: alertMessage)
        }
    }
    
    func checkLoginStatus() async {
        if let token = KeychainService.getToken() {
            await validateToken(token: token)
        } else {
            isLogged = false
        }
    }
    
    func validateToken(token: String) async {
        guard let url = URLComponents(string: "\(baseURL)/validateToken")?.url else {
            print("Invalid URL: \(baseURL)/validateToken")
            isLogged = false
            return
        }
        
//        var request = URLRequest(url: url)
 
//        request.setValue("Barrer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (authResponse, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .POST) as (ValidateResponse, HTTPURLResponse)
            
            if (200...299).contains(httpResponse.statusCode){
                self.isLogged = true
            } else {
                self.isLogged = false
            }
        } catch {
            self.isLogged = false
        }
    }
}



