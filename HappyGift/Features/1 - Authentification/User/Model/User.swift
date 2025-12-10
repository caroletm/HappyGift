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
    var email: String
    var password: String
    var telephone : String
    }

//let userStandard = User(id: UUID(), name: "Carole", email : "carole@gmail.com", password: "cacao123", telephone: "000000000")

