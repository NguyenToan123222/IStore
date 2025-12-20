//
//  Login.swift
//  IStore
//
//  Created by Nguyễn Toàn on 21/8/25.
//

import SwiftUI

struct Login: View {
    @Environment(AuthVM.self) var vm
    
    var body: some View {
        @Bindable var vmBindable = vm
        NavigationStack {
            VStack(spacing: 8) {
                FormField(value: $vmBindable.emailLogin, icon: "envelope.circle", placeholder: "Email", validateState: vmBindable.emailValidStateLogin)
                FormField(value: $vmBindable.passwordLogin, icon: "lock.circle", placeholder: "Password", isSecure: true, validateState: vmBindable.passwordValidStateLogin)
                
                Button(action: {
                    Task{
                        try await vmBindable.login(email: vmBindable.emailLogin, password: vmBindable.passwordLogin)
                    }
                }) {
                    Text("Login")
                        .buttonTextModifier()
                }
                .disabled(vmBindable.isValidLogin ? false : true)
                
                NavigationLink(destination: ForgotPassword()) {
                    Navlink(text: "Forgot", subText: "Password")
                }
            }
            .padding(.horizontal, 32)
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
            Spacer()
            NavigationLink(destination: Register()) {
                Navlink(text: "New?", subText: "Create Account")
            }
        }
    }
}

#Preview {
    Login()
        .environment(AuthVM())
}
