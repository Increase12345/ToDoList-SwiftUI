//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var vm = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                vm.toggleIsDonecheckmark(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
