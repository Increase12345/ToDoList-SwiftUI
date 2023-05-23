//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var vm = NewItemViewViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                // Title
                Text("New Item")
                    .font(.system(size: 32).bold())
                
                // TextField for todo name
                TextField("Title...", text: $vm.title)
                Divider()
                
                // Due Date
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(.graphical)
                
                // Button
                HStack {
                    TLButton(title: "Save", background: vm.validationForm ? .pink: .gray) {
                        Task { await vm.save() }
                        dismiss()
                    }
                    .disabled(vm.validationForm ? false: true)
                    .padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
