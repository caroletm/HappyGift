//
//  Event.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import Foundation

struct Event : Identifiable {
    var id : UUID = UUID()
    var nomEvent : String
    var descriptionEvent : String
    var imageEvent : String
    var dateEvent : Date
    var lieuEvent : String
    var participants : [Participant]
    var prixCadeau : Int
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

var santa1 = Event(nomEvent: "Le noël des enfants", descriptionEvent: "blablabla", imageEvent: "carChristmas", dateEvent: Date.from("25/12/2025 20:00"), lieuEvent: "Chez moi", participants: [], prixCadeau: 35)
var santa2 = Event(nomEvent: "Le noël des zombies", descriptionEvent: "hello", imageEvent: "houseChristmas", dateEvent: Date.from("24/12/2025 20:00"), lieuEvent: "Chez Papa", participants: [], prixCadeau: 35)
var santa3 = Event(nomEvent: "Noël en famille", descriptionEvent: "hello", imageEvent: "houseChristmas", dateEvent: Date.from("15/12/2025 20:00"), lieuEvent: "Chez Papa", participants: [], prixCadeau: 45)

var events : [Event] = [santa1, santa2, santa3]
