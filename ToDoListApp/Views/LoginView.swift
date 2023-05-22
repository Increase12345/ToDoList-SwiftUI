//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(rotation: 15, color: .pink, headerText: "To Do List", headerSubText: "Get things done")
                
                // Login Form
                Group {
                    ZStack {
                        Color(.white)
                        VStack(spacing: 20) {
                            TextField("Email Address...", text: $vm.email)
                                .modifier(TextFieldModificator())
                            SecureField("Password...", text: $vm.password)
                                .modifier(TextFieldModificator())
                            
                            TLButton(title: "Log In", background: .blue) {
                                
                            }
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 40)
                    }
                    .frame(width: 300, height: 250)
                    .cornerRadius(20)
                }
                
                // Create Account
                Spacer()
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 50)
            }
            .background(Color(.systemGray6))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
