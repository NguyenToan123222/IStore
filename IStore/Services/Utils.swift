//
//  Utils.swift
//  IStore
//
//  Created by Nguyễn Toàn on 21/8/25.
//

import Foundation
import SwiftUICore
import SwiftUI
import Security


let baseURL = "http://localhost:4000"

enum ValidateState {
    case valid
    case invalid
    case empty
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = (email.range(of: emailRegex, options: .regularExpression) != nil)
    return emailTest
}


struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundStyle(.red)
            .font(.system(size: 20, weight: .heavy))
            .background(Color.black)
            .cornerRadius(10)
    }
}

extension View {
    
    public func buttonTextModifier() -> some View {
        self.modifier(ButtonTextModifier())
    }
    
    func backButtonModifier(dismiss: DismissAction) -> some View { // internal and not recycle
        self.modifier(BackButtonModifier(dismiss: dismiss))
    }
    
    func tabbarModifier(symbol: String, tag: Int) -> some View {
        self.modifier(TabViewModifier(symbol: symbol, tag: tag))
    }
}

struct BackButtonModifier: ViewModifier {
    var dismiss: DismissAction
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .tint(.black)
                    }

                }
            }
    }
}


class KeychainService{
    static func saveToken(token: String) {
        let data = Data(token.utf8)
        let query = [
            kSecClass: kSecClassGenericPassword, kSecAttrAccount: "authToken", kSecValueData: data
        ] as CFDictionary
        
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
        static func getToken() -> String? {
            // var data: Data?
            let query = [
                kSecClass: kSecClassGenericPassword, kSecAttrAccount: "authToken", kSecReturnData: true, kSecMatchLimit: kSecMatchLimitOne
            ] as CFDictionary
            
            var dataTypeRef: AnyObject? = nil
            let status = SecItemCopyMatching(query, &dataTypeRef)
        
            if status == errSecSuccess {
                guard let data = dataTypeRef as? Data else { return nil }
                return String(decoding: data, as: UTF8.self)
            } else {
                return nil
            }
    }
    static func deleteToken() {
        // var data: Data?
        let query = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: "authToken" ] as CFDictionary
    
        SecItemDelete(query)
        
        }
    
}

enum ItemCategories: String {
    case ipad = "ipad"
    case iphone = "iphone"
    case macbook = "macbook"
    case airpods = "airpods"
    case trending = "star.fill"
    case applewatch = "applewatch"
}
