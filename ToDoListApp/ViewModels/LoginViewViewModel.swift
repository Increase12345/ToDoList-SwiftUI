//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    var validateForm: Bool {
        !email.contains("@") || !email.contains(".") || password.count < 6 ? true: false
    }
    
    func login() async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("Failed to login \(error)")
        }
    }
}
