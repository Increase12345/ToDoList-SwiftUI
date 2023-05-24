//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = RegisterViewViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            // Header
            HeaderView(rotation: -15, color: .orange, headerText: "Register", headerSubText: "Start organizing todos")
            
            // Register Form
            Group {
                ZStack {
                    Color(.white)
                    VStack(spacing: 20) {
                        TextField("Full Name...", text: $vm.name)
                            .modifier(TextFieldModificator())
                            .textInputAutocapitalization(.sentences)
                        TextField("Email Address...", text: $vm.email)
                            .modifier(TextFieldModificator())
                        SecureField("Password...", text: $vm.password)
                            .modifier(TextFieldModificator())
                        
                        TLButton(title: "Create Account", background: vm.validateForm ? .gray: .green) {
                            Task { try await vm.register() }
                        }
                        .disabled(vm.validateForm)
                    }
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 40)
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            }
            
            Spacer()
            
            HStack {
                Text("Have an account?")
                Text("Log In")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        dismiss()
                    }
            }
            .padding(.bottom, 50)
            
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
