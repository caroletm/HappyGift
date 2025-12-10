//
//  AppRoute.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import Foundation

enum AppRoute: Hashable {
    
    case landing
    case createEvent
    case recapEvent
    case detailEvent(event: EventDTO)
    case listEvent
    case joinEvent
    case participantList
    case enveloppeView (letter: Letter)
    case letterView (letter: Letter)
    case writeLetter
    case mailbox
    case tirageView
    
}
