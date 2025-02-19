//
//  APIManager.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 16/01/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case unknown
}

final class APIManager {
    
    func request<T: Decodable>(_ url: String) async throws -> T {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else  {
            throw NetworkError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
