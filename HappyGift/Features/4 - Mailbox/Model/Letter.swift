//
//  MailboModel.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

struct Letter:  Hashable {
    
    var id = UUID()
    var destinataire : UUID
    var userMessage: String
    var expediteur: UUID
    var signature : String
    var type : TypeLetter
}

//MARK: - Database Letters

var letterFromAlice = LetterDTO(
    id: nil,
    message: """
    Cette année, j'ai été très sage et j'ai aidé mes amis et ma famille.
    J'aimerais beaucoup recevoir un vélo rouge avec un panier, et si tu as de la place,
    quelques livres d'aventure.
    Merci beaucoup et joyeux Noël !
    """,
    signature: "Alice",
    typeLetter: .fromFriendToUser,
    date: nil,
    expediteur: UUID(),
    destinataire: userStandard.id
)

var letterFromBob = LetterDTO(
    id: nil,
    message: "Holaaa! Je voudrais une playstation",
    signature: "Bob",
    typeLetter: .fromFriendToUser,
    date: nil,
    expediteur: UUID(),
    destinataire: userStandard.id
)

var letterFromSarah = LetterDTO(
    id: nil,
    message: "Merci beaucoup pour tout ce que tu as fait pour moi cette année !",
    signature: "Sarah",
    typeLetter: .fromFriendToUser,
    date: nil,
    expediteur: UUID(),
    destinataire: userStandard.id
)
