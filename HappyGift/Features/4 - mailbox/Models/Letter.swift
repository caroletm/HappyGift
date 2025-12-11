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
    var type : LetterType
}

//MARK: - Database Letters

var letterFromAlice: Letter = Letter(destinataire: participantStandard.id, userMessage: "Cette année, j'ai été très sage et j'ai aidé mes amis et ma famille. J'aimerais beaucoup recevoir un vélo rouge avec un panier, et si tu as de la place, quelques livres d'aventure \nMerci beaucoup et joyeux Noël !", expediteur: UUID(), signature: "Alice", type: .fromFriendToUser)
var letterFromBob: Letter = Letter(destinataire: participantStandard.id, userMessage: "Holaaa! Je voudrais une playstation", expediteur: UUID(), signature: "Bob", type: .fromFriendToUser)
var letterFromSarah: Letter = Letter(destinataire: participantStandard.id, userMessage: "Merci beaucoup pour tout ce que tu as fait pour moi cette année !", expediteur: UUID(), signature: "Sarah", type: .fromFriendToUser)
