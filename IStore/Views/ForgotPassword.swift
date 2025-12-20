//
//  ForgotPassword.swift
//  IStore
//
//  Created by Nguyễn Toàn on 23/8/25.
//

import SwiftUI

struct ForgotPassword: View {

    @Environment(\.dismiss) var dismiss
    @Environment(AuthVM.self) var vm
    
    var body: some View {
        @Bindable var vmBindable = vm
        VStack(spacing: 24) {
            FormField(value: $vmBindable.emailForget, icon: "envelope.circle", placeholder: "Email", validateState: vmBindable.emailValidStateForget)
            
            Button(action: {
                Task {
                    try await vmBindable.forgotPassword(email: vmBindable.emailForget)
                }
            }) {
                Text("Reset")
                    .buttonTextModifier()
            }
            .disabled(vmBindable.isvalidForget ? false : true)
            
            Button (action: {
                vmBindable.showForgot = true
            }) {
                Navlink(text: "Validate", subText: "Code")
            }
        }
        .padding(.horizontal, 32)
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
        .navigationTitle("Forget Password")
        
        .sheet(isPresented: $vmBindable.showForgot) {
            Group {
                if vmBindable.acceptedCode {
                    VStack {
                        Text ("Enter New Password")
                            .font(.title)
                        FormField(value: $vmBindable.resetEmail, icon: "envelope.circle", placeholder: "Email", validateState: vmBindable.resetEmailValidState)
                        FormField(value: $vmBindable.resetPassword, icon: "lock.circle", placeholder: "Password", isSecure: true, validateState: vmBindable.resetPasswordValidState)
                        
                        Button {
                            Task {
                                try await vmBindable.resetPassword(email: vmBindable.resetEmail, password: vmBindable.resetPassword)
                            }
                        } label: {
                            Text ("Validate")
                                .buttonTextModifier()
                        }
                    }

                } else {
                    VStack {
                        Text("Enter Reset Code")
                            .font(.title)
                        FormField(value: $vmBindable.forgetCode, icon: "number.circle", placeholder: "Code", validateState: vmBindable.codeValidStateRegister)

                        Button {
                            Task {
                                try await vmBindable.validateReset(code: vmBindable.forgetCode)
                            }
                        } label: {
                            Text ("Change Password")
                                .buttonTextModifier()
                        }
                        .disabled(vmBindable.isvalidCode ? false : true)
                    }
                }
            }
            .presentationDetents([.fraction(0.3), .fraction(0.5)])
            .padding(.horizontal, 32)
        }
        
        
        
        
        Spacer()

    }
}

#Preview {
    ForgotPassword()
        .environment(AuthVM())
}
