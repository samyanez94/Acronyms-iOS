//
//  User.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import Foundation

final class User: Codable {
    var id: UUID?
    var name: String
    var username: String

    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
}
