//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct HeaderView: View {
    var rotation: CGFloat
    var color: Color
    var headerText: String
    var headerSubText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: rotation))
            VStack {
                Text(headerText)
                    .font(.system(size: 50))
                    .bold()
                Text(headerSubText)
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 310)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(rotation: 15, color: .pink, headerText: "Header", headerSubText: "subview")
    }
}
