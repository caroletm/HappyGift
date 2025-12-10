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
    
    var eventsVM : [EventDTO] = []
    
    var currentEvent: EventDTO?
    
    //MARK: -  Create Event
    
    var iconsEvent : [String] = ["carChristmas", "iconChristmas", "houseChristmas"]
    var nomEvent: String = ""
    var descriptionEvent: String = ""
    var dateEvent: Date = Date()
    var lieuEvent: String = ""
    var priceGift: Int = 0
    var iconSelected: String? = nil
    var participants : [ParticipantCreateDTO] = []
    
    func createEvent() async {
        let newEvent  = EventCreateDTO(
            nom: nomEvent,
            description: descriptionEvent,
            image: iconSelected ?? "carChristmas",
            date: dateEvent,
            lieu: lieuEvent,
            prixCadeau: priceGift,
            participants: participants.map {
                ParticipantCreateDTO(name: $0.name, email: $0.email, telephone: $0.telephone)
            }
        )
        do {
            let eventCreated = try await service.createEvent(newEvent)
            currentEvent = eventCreated
            eventsVM.append(eventCreated)
            resetFormEvent()
        }catch{
            print("erreur dans la creation de l'event : \(error)")
        }
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
    
    var isValidFormEvent: Bool {
        return !nomEvent.isEmpty && !descriptionEvent.isEmpty && !lieuEvent.isEmpty
    }
    var isValidFormEvent2: Bool {
        return !nomEvent.isEmpty && !descriptionEvent.isEmpty && !lieuEvent.isEmpty && priceGift > 0 && !participants.isEmpty
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
    
    var isValidParticipant: Bool {
        return !name.isEmpty &&
               isValidEmail(email) &&
               isValidPhone(tel)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        let phoneRegEx = #"^\+?[0-9]{10,15}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return predicate.evaluate(with: phone)
    }
    
    func addParticipant(){
        let participant  = ParticipantCreateDTO(name: name, email: email, telephone: tel)
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

    
    func findDrawForCurrentUser(eventId: UUID, userEmail: String) async {
        
        // Appel direct à l'API → pas besoin de currentEvent
        guard let event = currentEvent else {
            print("⚠️ currentEvent est nil dans findDrawForCurrentUser")
            return
        }

        // 1. Retrouver le participant associé au user
        guard let me = event.participants.first(where: { $0.email == userEmail }) else {
            print("⚠️ Aucun participant trouvé avec cet email")
            return
        }

        do {
            // 2. Appel BACKEND : /event/:eventId/draw/:participantId
            let draw = try await service.fetchDraw(eventId: eventId, participantId: me.id!)

            // 3. Mise à jour de la vue
            self.selectedPerson = draw.receiverName
            self.selectedPersonParticipantID = draw.receiverId
            self.showSnow = true

        } catch {
            print("❌ Erreur tirage:", error)
        }
    }
    //    var tirageResult: [UUID: UUID] = [:]
    //    func doTirage() {
    //           guard let event = currentEvent else {
    //               print("Pas d’event sélectionné")
    //               return
    //           }
    //
    //           let participants = event.participants
    //
    //           guard participants.count > 1 else {
    //               print(" Pas assez de participants pour tirer au sort")
    //               return
    //           }
    //
    //           var shuffled = participants.shuffled()
    //           tirageResult.removeAll()
    //
    //           for (index, participant) in participants.enumerated() {
    //               var drawn = shuffled[index]
    //
    //               if drawn.id == participant.id {
    //                   let nextIndex = (index + 1) % participants.count
    //                   shuffled.swapAt(index, nextIndex)
    //                   drawn = shuffled[index]
    //               }
    //
    //               tirageResult[participant.id] = drawn.id
    //           }
    //
    //           print(" Tirage effectué → \(tirageResult)")
    //       }
    
    

    
    //    func handleShake() {
    //        doTirage()
    //        if let drawn = getDrawnPerson(for: userVM.name) {
    //            withAnimation(.easeOut(duration: 1.0)) {
    //                showSnow = true
    //                selectedPerson = drawn.name
    //                selectedPersonParticipantID = drawn.id
    //                print("tiré au sort : \(drawn.name)")
    //            }
    //        }else{
    //            print("pas réussi à tirer au sort")
    //        }
    //    }
    
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
    
    var eventsSortedByDate: [EventDTO] {
        eventsVM.sorted { $0.date < $1.date }
    }
    
    // MARK: - CallAPI
    
    let service = EventService()
}








