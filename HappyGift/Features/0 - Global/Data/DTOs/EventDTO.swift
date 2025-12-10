//
//  EventDTO.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import Foundation

struct EventCreateDTO: Codable, Hashable {
    var nom: String
    var description: String
    var image: String
    var date: Date
    var lieu: String
    var prixCadeau: Int
    var participants: [ParticipantCreateDTO]
}

struct EventDTO: Codable, Hashable, Identifiable {
    var id: UUID?
    var nom: String
    var description: String
    var image: String
    var date: Date
    var lieu: String
    var prixCadeau: Int
    var codeEvent: String
    var creatorId: UUID
    var participants: [ParticipantDTO]
    var tirages: [TirageDTO]
}
