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
            print("event créé")
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

    func findDrawForCurrentUser(eventId: UUID) async {
        do {
            let draw = try await service.fetchDraw(eventId: eventId)
            selectedPerson = draw.receiverName
            selectedPersonParticipantID = draw.receiverId
            showSnow = true
            print("tu dois offrir un cadeau a \(draw.receiverName)")
        } catch {
            print("Erreur tirage:", error)
        }
    }
    
    func resetTirage() {
        selectedPerson = nil
        selectedPersonParticipantID = nil
        showSnow = false
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
    
    var eventsSortedByDate: [EventDTO] {
        eventsVM.sorted { $0.date < $1.date }
    }
    
    // MARK: - CallAPI
    
    let service = EventService()
    
    //Recupérer les events
    func fetchEvents() async {
        do {
            eventsVM = try await service.getAllEvents()
            print("Events récupérés : \(eventsVM)")
        } catch {
            print("Erreur dans le chargement des events: \(error)")
        }
    }
    
    //Rejoindre un event
    func joinEvent(email: String, code: String) async {
        do {
            _ = try await service.joinEvent(email: email, code: code)
            print("Event rejoint")
        } catch {
            print("Erreur lors de la tentative de rejoindre un event: \(error)")
        }
    }
}









