//
//  MailboModel.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

struct Letter:  Hashable {
    
    var userMessage: String
    var signature: String
}

//MARK: - Database Letters

var letterFromAlice: Letter = Letter(userMessage: "Cette année, j'ai été très sage et j'ai aidé mes amis et ma famille. J'aimerais beaucoup recevoir un vélo rouge avec un panier, et si tu as de la place, quelques livres d'aventure \nMerci beaucoup et joyeux Noël !", signature: "Alice")
var letterFromBob: Letter = Letter(userMessage: "Holaaa! Je voudrais une playsation", signature: "Bob")
var letterFromSarah: Letter = Letter(userMessage: "Merci beaucoup pour tout ce que tu as fait pour moi cette année !", signature: "Sarah")
