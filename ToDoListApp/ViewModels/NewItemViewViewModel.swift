//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    func save() async {
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // save model
        guard let encodedItem = try? Firestore.Encoder().encode(newItem) else { return }
        try? await Firestore.firestore().collection("users").document(uId).collection("todos").document(newId).setData(encodedItem)
        
    }
    
    var validationForm: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
}
