//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

//MARK: ViewModel for list of items view
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(id: String) {
        Firestore.firestore().collection("users").document(userId).collection("todos").document(id).delete()
    }
    
}
