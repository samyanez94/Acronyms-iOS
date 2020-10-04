//
//  Category.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import Foundation

final class Category: Codable {
    var id: UUID?
    var name: String

    init(name: String) {
        self.name = name
    }
}
