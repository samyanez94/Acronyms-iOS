//
//  CreateAcronymData.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import Foundation

struct CreateAcronymData: Codable {
    let short: String
    let long: String
    let userId: UUID
}

extension Acronym {
    func toCreateData() -> CreateAcronymData {
        CreateAcronymData(
            short: short,
            long: long,
            userId: user.id
        )
    }
}
