//
//  EventViewModel.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable

class EventViewModel {
    
    //MARK: -  Create Event
    
    var iconsEvent : [String] = ["carChristmas", "iconChristmas", "houseChristmas"]
    
    var nomEvent: String = ""
    var descriptionEvent: String = ""
    var imageEvent: String = ""
    var dateEvent: Date = Date()
    var lieuEvent: String = ""
    
}


