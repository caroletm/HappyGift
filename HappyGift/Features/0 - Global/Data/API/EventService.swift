//
//  EventService.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//
//
import Foundation

struct EventService {
    
    func createEvent(_ dto: EventCreateDTO) async throws -> EventDTO {
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token toruvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let eventCreated: EventDTO = try await APIService.shared.post("/event", body: dto, token: token)
        return eventCreated
    }
    
    func fetchDraw(eventId: UUID) async throws -> DrawResultDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token toruvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        // GET /event/:eventId/draw/
        let tirageFetch: DrawResultDTO = try await APIService.shared.get("/event/\(eventId)/draw", token : token)
        return tirageFetch
    }
    
    func getAllEvents() async throws -> [EventDTO] {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let eventsFetch: [EventDTO] = try await APIService.shared.get("/event", token : token)
        return eventsFetch
    }
    
    func joinEvent(email: String, code: String) async throws -> ParticipantJoinResponse {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token trouvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        let dto = ParticipantJoinDTO(email: email, codeEvent: code)
        return try await APIService.shared.post("/participant/join", body: dto, token: token)
    }
}
