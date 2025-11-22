//
//  UserModel.swift
//  HappyGift
//
//  Created by Apprenant125 on 13/11/2025.
//

import Foundation

struct User : Identifiable {
    var id: UUID
    var name: String
    var events : [Event]
    var letters : [Letter]
    }

let userStandard = User(id: UUID(), name: "Carole", events: [santa1,santa2], letters: [letterFromBob,letterFromAlice,letterFromSarah,letterFromBob,letterFromAlice,letterFromSarah])

