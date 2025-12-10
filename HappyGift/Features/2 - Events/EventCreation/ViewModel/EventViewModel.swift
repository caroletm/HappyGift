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

    var eventsVM : [Event] = [santa1, santa2]
    
    var currentEvent: Event?
    
    //MARK: -  Create Event
    
    var iconsEvent : [String] = ["carChristmas", "iconChristmas", "houseChristmas"]
    var nomEvent: String = ""
    var descriptionEvent: String = ""
    var dateEvent: Date = Date()
    var lieuEvent: String = ""
    var priceGift: Int = 0
    var iconSelected: String? = nil
    var participants : [Participant] = []
    
    func createEvent() {
        let newEvent  = Event(id: UUID(), nomEvent: nomEvent, descriptionEvent: descriptionEvent, imageEvent: iconSelected ?? "", dateEvent: dateEvent, lieuEvent: lieuEvent, participants: participants, prixCadeau: priceGift, codeEvent: "SANTA")
        eventsVM.append(newEvent)
        currentEvent = newEvent
    }
    
    func resetFormEvent() {
        nomEvent = ""
        descriptionEvent = ""
        dateEvent = Date()
        lieuEvent = ""
        priceGift = 0
        iconSelected = nil
        participants = []
    }
    
    //MARK: -  Incrémenter budget
    
    func addBudget() {
        priceGift += 1
    }
    func minusBudget() {
        priceGift -= 1
    }
    
    //MARK: -  Gestion des participants

    var name: String = ""
    var tel: String = ""
    var email: String = ""
    
    var isAddParticipant: Bool = false

 func addParticipant(){
     let participant  = Participant(name: name, tel: tel, email: email)
     participants.append(participant)
 }
 
 func reset(){
     name = ""
     tel = ""
     email = ""
 }
 
 // MARK: - Tirage
    
    var showSnow = false
    var selectedPerson: String? = nil
    var selectedPersonParticipantID: UUID? = nil
    var tirageResult: [UUID: UUID] = [:]
    
    func doTirage() {
           guard let event = currentEvent else {
               print("Pas d’event sélectionné")
               return
           }

           let participants = event.participants

           guard participants.count > 1 else {
               print(" Pas assez de participants pour tirer au sort")
               return
           }

           var shuffled = participants.shuffled()
           tirageResult.removeAll()

           for (index, participant) in participants.enumerated() {
               var drawn = shuffled[index]

               if drawn.id == participant.id {
                   let nextIndex = (index + 1) % participants.count
                   shuffled.swapAt(index, nextIndex)
                   drawn = shuffled[index]
               }

               tirageResult[participant.id] = drawn.id
           }

           print(" Tirage effectué → \(tirageResult)")
       }

 
 func getDrawnPerson(for participantName: String) -> Participant? {
     guard let current = participants.first(where: { $0.name == participantName }),
           let drawnID = tirageResult[current.id],
           let drawn = participants.first(where: { $0.id == drawnID }) else {
         return nil
     }
     print("Personne tirée : \(drawn)")
     return drawn
 }
    
    func handleShake() {
        doTirage()
        if let drawn = getDrawnPerson(for: userStandard.name) {
            withAnimation(.easeOut(duration: 1.0)) {
                showSnow = true
                selectedPerson = drawn.name
                selectedPersonParticipantID = drawn.id
                print("tiré au sort : \(drawn.name)")
            }
        }else{
            print("pas réussi à tirer au sort")
        }
    }
    
    // MARK: - EventList
    
    var isJoinEvent: Bool = false
    var isAddEvent: Bool = false
    var codeEvent : String = ""
    func joinEvent(typeEvent: Bool){
        if typeEvent == isAddEvent{
            isAddEvent = true
            
        }else if typeEvent == isJoinEvent{
            isJoinEvent = true
        }
    }
    
    var eventsSortedByDate: [Event] {
        eventsVM.sorted { $0.dateEvent < $1.dateEvent }
    }
}








