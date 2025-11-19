//
//  Participant.swift
//  HappyGift
//
//  Created by apprenant152 on 12/11/2025.
//

import Foundation

struct Participant: Identifiable, Hashable{
    let id = UUID()
    let name : String
    let tel: String
    let email : String
}
