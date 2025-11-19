//
//  UserModel.swift
//  HappyGift
//
//  Created by Apprenant125 on 13/11/2025.
//

import Foundation

struct UserModel : Identifiable {
    var id: UUID
    var name: String
    var events : [Event] = []
    var letters : [Letter] = []
    
    }

let userStandard = UserModel(id: UUID(), name: "Carole")

