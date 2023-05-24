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
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading) {
                    if let user = vm.user {
                        profileView(user: user)
                    }
                }
                
                Button {
                    Task { try vm.signOut() }
                } label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .bold()
                }
                .padding(.top, 20)
            }
            .navigationTitle("Profile")
        }
    }
    
    @ViewBuilder
    func profileView(user: User) -> some View {
        Text("Name:")
            .padding(.top, 25)
        Text(user.name)
            .bold()
        Text("Email:")
            .padding(.top, 10)
        Text(user.email)
            .bold()
        Text("Member Since:")
            .padding(.top, 10)
        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            .bold()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
