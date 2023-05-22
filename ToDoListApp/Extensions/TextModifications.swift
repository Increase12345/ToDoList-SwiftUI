//
//  TextModifications.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/22/23.
//

import Foundation
import SwiftUI

struct TextFieldModificator: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}
