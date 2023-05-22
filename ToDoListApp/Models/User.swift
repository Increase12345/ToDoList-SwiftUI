//
//  User.swift
//  ToDoListApp
//
//  Created by Nick Pavlov on 5/21/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
