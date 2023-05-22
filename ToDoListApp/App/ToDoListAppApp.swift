//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/20/23.
//

import SwiftUI
import Firebase

@main
struct ToDoListAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
