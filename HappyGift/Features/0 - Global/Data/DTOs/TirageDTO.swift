//
//  TirageDTO.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import Foundation

struct TirageDTO: Codable, Hashable {
    var giverId: UUID
    var receiverId: UUID
}

struct DrawResultDTO: Codable, Hashable {
    let giverId: UUID
    let receiverId: UUID
    let receiverName: String
}
