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
    
    //MARK: -  Data Event

    var eventsVM : [Event] = events
    
    //MARK: -  Create Event
    
    var iconsEvent : [String] = ["carChristmas", "iconChristmas", "houseChristmas"]
    
    var nomEvent: String = "Le noel des lutins"
    var descriptionEvent: String = "On s’offre des cadeaux rigolos, avec plein de petits trucs sympas mais on se fait plaisir. \n\n C’est Noel il faut rigoler le père Noel est mignon."
    var imageEvent: String = "carChristmas"
    var dateEvent: Date = Date()
    var lieuEvent: String = "A la maison"
    var priceGift: Int = 30
    
    //MARK: -  Incrémenter budget
    
    func addBudget() {
        priceGift += 1
    }
    
    func minusBudget() {
        priceGift -= 1
    }
}







