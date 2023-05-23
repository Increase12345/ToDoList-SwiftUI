//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var vm: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._vm = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                        ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                vm.deleteItem(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do Lost")
            .toolbar {
                Button {
                    vm.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $vm.showingNewItemView) {
            NewItemView()
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "VZEeTxtIACODEXT68XnClCszEKM2")
    }
}
