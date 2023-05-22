//
//  MainView.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    
    var body: some View {
        if vm.isSignedIn, !vm.currentUserId.isEmpty {
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
