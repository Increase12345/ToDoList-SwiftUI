//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/22/23.
//

import SwiftUI

struct TLButton: View {
    var title: String
    var background: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(width: 160, height: 45)
                .background(background)
                .clipShape(Capsule())
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Button", background: .blue, action: {})
    }
}
