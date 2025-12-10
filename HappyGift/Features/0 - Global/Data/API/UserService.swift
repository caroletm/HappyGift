//
//  UserService.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import Foundation

final class UserService {
    static let shared = UserService()
    private let api = APIService.shared
    
    init() {}
    
    // Connexion
    func login(email: String, motDePasse: String) async throws -> String {
        let body = LoginRequest(email: email, password: motDePasse)
        // Le endpoint /users/login retourne directement un String (le token)
        let response: LoginResponse = try await api.post("/users/login", body: body)
        return response.token
    }
    
    //      profil utilisateur avec le token
    func getProfile(token: String) async throws -> UserDTO {
        guard let url = URL(string: APIService.shared.baseURL + "/users/profile") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder.iso8601Decoder.decode(UserDTO.self, from: data)
    }
    
    // Inscription
    func signUp(name: String, email: String, password : String, telephone: String) async throws -> UserDTO {
        let body = UserCreateDTO(name: name, email: email, password: password, telephone: telephone)
        return try await api.post("/users", body: body)
    }
    
}
