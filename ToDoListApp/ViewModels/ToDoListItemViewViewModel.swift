//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation
import Firebase

//MARK: ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    
    func toggleIsDonecheckmark(item: ToDoListItem) async {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        guard let encodedItem = try? Firestore.Encoder().encode(itemCopy) else { return }
        try? await Firestore.firestore().collection("users").document(uId).collection("todos").document(itemCopy.id).setData(encodedItem)
    }
}
