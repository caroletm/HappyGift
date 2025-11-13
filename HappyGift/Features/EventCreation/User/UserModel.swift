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
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

let userStandard = UserModel(id: UUID(), name: "Alice")
