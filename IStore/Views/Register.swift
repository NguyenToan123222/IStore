//
//  Register.swift
//  IStore
//
//  Created by Nguyễn Toàn on 23/8/25.
//

import SwiftUI

struct Register: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AuthVM.self) var vm
    var body: some View {
        @Bindable var vmBindable = vm
        VStack {
            FormField(value: $vmBindable.nameRegister, icon: "person.circle", placeholder: "Name", validateState: vmBindable.nameValidRegister)
            FormField(value: $vmBindable.emailRegister, icon: "envelope.circle", placeholder: "Email", validateState: vmBindable.nameValidRegister)
            FormField(value: $vmBindable.passwordRegister, icon: "lock.circle", placeholder: "Password", validateState: vmBindable.passwordValidStateRegister)
            
            Button(action: {
                Task {
                    try await
                    vmBindable.register(name: vm.nameRegister, email: vm.emailRegister, password: vm.passwordRegister)
                }
            }) {
                Text("Register")
                    .buttonTextModifier()
            }
            .disabled(vmBindable.isvalidRegister ? false : true)
        }
        .padding(.horizontal, 32)
        .navigationBarBackButtonHidden(true)
        .backButtonModifier(dismiss: dismiss)
        .alert(vm.alertTitle, isPresented: $vmBindable.showALert) {
            Button ("OK", role: .cancel) {
                
            }
        } message: {
            Text(vmBindable.alertMessage)
        }
        .sheet(isPresented: $vmBindable.showRegister) {
            VStack {
                Text ("Enter Validation Code")
                    .font(.title)
                
                FormField(value: $vmBindable.forgetCode, icon: "number.circle", placeholder: "Code", validateState: vmBindable.codeValidStateRegister)
                
                Button (action: {
                    Task {
                        try await vmBindable.validate(code: vmBindable.forgetCode)
                    }
                }) {
                    Text("Validate")
                        .buttonTextModifier()
                }
                .disabled(vmBindable.isvalidCode ? false : true)
                
                
            }
        } // Sheet
        Button (action: {
            vmBindable.showForgot = true
        }) {
            Navlink(text: "Validate", subText: "Code")
        }
        
        
        Spacer()
        
        NavigationLink(destination: ForgotPassword()) {
            Navlink(text: "Forgot", subText: "Password")
        }
        .navigationTitle("Register")
    }
}

#Preview {
    Register()
        .environment(AuthVM())
}
