//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        Auth.auth().currentUser != nil
    }
}
