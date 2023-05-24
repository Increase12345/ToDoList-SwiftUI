//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

class ProfileViewViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        Task { try await fetchUser() }
    }
    
    @MainActor
    func fetchUser() async throws {
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uId).getDocument()
            self.user = try snapshot.data(as: User.self)
        } catch {
            print("Failrd to get user \(error)")
        }
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Failed to signOut: \(error)")
        }
    }
}
