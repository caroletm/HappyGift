//
//  Untitled.swift
//  HappyGift
//
//  Created by caroletm on 11/12/2025.
//

import Foundation

struct LetterService {
    
    func getAllLetters() async throws -> [LetterDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let lettersFetch: [LetterDTO] = try await APIService.shared.get("/letter", token : token)
        return lettersFetch
    }
    
    func createLetter(_ dto: LetterCreateDTO) async throws -> LetterDTO {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token toruvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let letterCreated: LetterDTO = try await APIService.shared.post("/letter", body: dto, token: token)
        return letterCreated
    }
}
