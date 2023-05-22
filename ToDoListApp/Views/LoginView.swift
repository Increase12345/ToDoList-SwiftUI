//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView()
                
                // Login Form
                Group {
                    ZStack {
                        Color(.systemGray6)
                        VStack(spacing: 20) {
                            TextField("Email Address...", text: $email)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(.white)
                                .cornerRadius(10)
                            SecureField("Password...", text: $password)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(.white)
                                .cornerRadius(10)
                            
                            Button {
                                
                            } label: {
                                Text("Log In")
                                    .frame(width: 120, height: 45)
                                    .background(.blue)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal, 40)
                    }
                    .frame(width: .infinity, height: 250)
                    .cornerRadius(20)
                }
                .padding(.horizontal)
                
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
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
