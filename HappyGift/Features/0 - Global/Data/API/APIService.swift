//
//  APIService.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    let baseURL : String = "https://api.mysecretsanta.cloud"
    
    private init() {}

    //METHODE GET
    func get<T: Decodable>(_ endpoint: String,token: String? = nil) async throws -> T {
        guard let url = URL(string : baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = token {
                    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                }

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder.iso8601Decoder.decode(T.self, from: data)
    }
    
    //METHODE POST
    func post<T: Codable, U: Decodable>(_ endpoint: String, body: T, token: String? = nil) async throws -> U {
        guard let url = URL(string : baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try JSONEncoder.iso8601Encoder.encode(body)
        
        // Appel réseau
          let (data, response) = try await URLSession.shared.data(for: request)
          
          // Affichage de la réponse brute pour debug
        
//        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        switch httpResponse.statusCode {
        case 200..<300:
            return try JSONDecoder.iso8601Decoder.decode(U.self, from: data)
        case 401 :
            throw URLError(.userAuthenticationRequired)
        default:
            throw URLError(.badServerResponse)
        }
    }
    
    //METHODE DELETE
    func delete(_ endpoint: String) async throws {
        guard let url = URL(string : baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
    
    //METHODE PATCH
    func patch<T: Codable, U: Decodable>(_ endpoint: String, body: T, token: String? = nil) async throws -> U {
        guard let url = URL(string : baseURL + endpoint) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        request.httpBody = try JSONEncoder.iso8601Encoder.encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder.iso8601Decoder.decode(U.self, from: data)
    }
}

extension JSONDecoder {
    static var iso8601Decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension JSONEncoder {
    static var iso8601Encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }
}
