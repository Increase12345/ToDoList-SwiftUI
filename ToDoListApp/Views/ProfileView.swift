//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
