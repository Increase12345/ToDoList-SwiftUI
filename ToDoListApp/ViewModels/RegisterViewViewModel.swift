//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    var validateForm: Bool {
        name.trimmingCharacters(in: .whitespaces).isEmpty ||
        !email.trimmingCharacters(in: .whitespaces).contains("@") ||
        !email.trimmingCharacters(in: .whitespaces).contains(".") ||
        password.trimmingCharacters(in: .whitespaces).count < 6 ? true: false
    }
    
    func register() async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            await uploadUserData(id: result.user.uid)
        } catch {
            print("DEBUG: Failed to register \(error)")
        }
    }
    
    func uploadUserData(id: String) async {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        guard let encodedUser = try? Firestore.Encoder().encode(newUser) else { return }
        try? await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
