//
//  ResourceRequestError.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import Foundation

enum ResourceRequestError: Error {
    case noData
    case decodingError
    case encodingError
}
