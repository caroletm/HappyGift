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
    

    func fetchDraw(eventId: UUID, participantId: UUID) async throws -> DrawResultDTO {
        
        guard let token = UserDefaults.standard.string(forKey: "token") else {
            print("Aucun token toruvé dans UserDefaults")
            throw URLError(.userAuthenticationRequired)
        }
        // GET /event/:eventId/draw/:participantId
        let tirageFetch: DrawResultDTO = try await APIService.shared.get("/event/\(eventId)/draw/\(participantId)", token : token)
        return tirageFetch
    }
}
