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
    
    var validateForm: Bool {
        !email.trimmingCharacters(in: .whitespaces).contains("@") || !email.trimmingCharacters(in: .whitespaces).contains(".") || password.trimmingCharacters(in: .whitespaces).count < 6 ? true: false
    }
    
    func login() async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("Failed to login \(error)")
        }
    }
}
