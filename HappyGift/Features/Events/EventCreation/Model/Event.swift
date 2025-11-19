//
//  Event.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import Foundation

class Event : Identifiable, Hashable {
    var id : UUID = UUID()
    var nomEvent : String
    var descriptionEvent : String
    var imageEvent : String
    var dateEvent : Date
    var lieuEvent : String
    var participants : [Participant]
    var prixCadeau : Int
    var codeEvent : String
    
    init(id: UUID, nomEvent: String, descriptionEvent: String, imageEvent: String, dateEvent: Date, lieuEvent: String, participants: [Participant], prixCadeau: Int, codeEvent: String) {
        self.id = id
        self.nomEvent = nomEvent
        self.descriptionEvent = descriptionEvent
        self.imageEvent = imageEvent
        self.dateEvent = dateEvent
        self.lieuEvent = lieuEvent
        self.participants = participants
        self.prixCadeau = prixCadeau
        self.codeEvent = codeEvent
    }
    
    // MARK: - Hashable
static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//MARK: - Date Formatter
extension Date {
    func formattedStringWithTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.string(from: self)
    }
}

extension Date {
    static func from(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter.date(from: string) ?? Date()
    }
}


//MARK: - Events Database

var santa1 = Event(id: UUID(), nomEvent: "Le noël des enfants", descriptionEvent: "blablabla", imageEvent: "carChristmas", dateEvent: Date.from("25/12/2025 20:00"), lieuEvent: "Chez moi",participants: [],prixCadeau: 35, codeEvent: "ABC123")
var santa2 = Event(id: UUID(), nomEvent: "Le noël des zombies", descriptionEvent: "hello", imageEvent: "houseChristmas", dateEvent: Date.from("24/12/2025 20:00"), lieuEvent: "Chez Papa", participants: [], prixCadeau: 35,codeEvent: "ABC456")
var santa3 = Event(id: UUID(), nomEvent: "Noël en famille", descriptionEvent: "hello", imageEvent: "houseChristmas", dateEvent: Date.from("15/12/2025 20:00"), lieuEvent: "Chez Papa", participants: [],prixCadeau: 45, codeEvent: "ABC456")

var events : [Event] = [santa1, santa2, santa3]
