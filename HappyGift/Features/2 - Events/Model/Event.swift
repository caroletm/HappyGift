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
    var participants : [ParticipantDTO]
    var prixCadeau : Int
    var codeEvent : String
    
    init(id: UUID, nomEvent: String, descriptionEvent: String, imageEvent: String, dateEvent: Date, lieuEvent: String, participants: [ParticipantDTO], prixCadeau: Int, codeEvent: String) {
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

//struct EventDTO: Codable, Hashable {
//    var id: UUID?
//    var nom: String
//    var description: String
//    var image: String
//    var date: Date
//    var lieu: String
//    var prixCadeau: Int
//    var codeEvent: String
//    var creatorId: UUID
//    var participants: [ParticipantDTO]
//    var tirages: [TirageDTO]
//}


var santa1 = EventDTO(id: UUID(), nom: "Le noël des enfants", description: "blablabla", image: "carChristmas", date: Date.from("25/12/2025 20:00"), lieu: "Chez moi",prixCadeau: 35, codeEvent: "ABC123", creatorId: UUID(), participants: [], tirages: [])



//var events : [Event] = [santa1, santa2, santa3]
