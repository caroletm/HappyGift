//
//  LetterDTO.swift
//  HappyGift
//
//  Created by caroletm on 11/12/2025.
//

import Foundation


struct LetterCreateDTO: Codable, Hashable {
    var message: String
    var signature: String
    var typeLetter: TypeLetter
    var eventId: UUID
}

struct LetterDTO: Codable, Hashable {
    var id: UUID?
    var message: String
    var signature: String
    var typeLetter: TypeLetter
    var date: Date?
    var expediteur: UUID
    var destinataire: UUID
}
