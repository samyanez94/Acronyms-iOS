//
//  ResourceRequest.swift
//  Acronyms
//
//  Created by Samuel Yanez on 10/4/20.
//

import Foundation

struct ResourceRequest<ResourceType> where ResourceType: Codable {
    let baseURL = "http://localhost:8080/api/"

    let resourceURL: URL

    init(resourcePath: String) {
        guard let resourceURL = URL(string: baseURL) else {
            fatalError("Failed to convert baseURL to a URL")
        }
        self.resourceURL = resourceURL.appendingPathComponent(resourcePath)
    }

    func getAll(completion: @escaping (Result<[ResourceType], ResourceRequestError>) -> Void) {
        URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let resources = try JSONDecoder().decode([ResourceType].self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
