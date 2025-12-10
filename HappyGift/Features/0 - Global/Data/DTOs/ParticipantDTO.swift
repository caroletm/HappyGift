//
//  ParticipantDTO.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import Foundation

struct ParticipantCreateDTO: Codable, Hashable {
    var name: String
    var email: String
    var telephone: String
}

struct ParticipantDTO: Codable, Hashable {
    var id: UUID?
    var name: String
    var email: String
    var telephone: String
}
