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
    
    var iconsEvent : [String] = ["carChristmas", "iconeSnowglobe", "iconeCouronne"]
    var nomEvent: String = ""
    var descriptionEvent: String = ""
    var dateEvent: Date = Date()
    var lieuEvent: String = ""
    var priceGift: Int = 0
    var iconSelected: String? = nil
    var participants : [ParticipantCreateDTO] = []
    var hasJustCreatedEvent: Bool = false
    
    func createEvent() async {
        let newEvent  = EventCreateDTO(
            nom: nomEvent,
            description: descriptionEvent,
            image: iconSelected ?? "carChristmas",
            date: dateEvent,
            lieu: lieuEvent,
            prixCadeau: priceGift,
            participants: participants.map {
                ParticipantCreateDTO(name: $0.name, email: $0.email, telephone: "0000000000")
            }
        )
        do {
            let eventCreated = try await service.createEvent(newEvent)
            currentEvent = eventCreated
            eventsVM.append(eventCreated)
            resetFormEvent()
            showName = false
            print("event créé, tirage effectué en back")
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
        showName = false
    }
    
    var isValidFormEvent: Bool {
        return !nomEvent.isEmpty && !descriptionEvent.isEmpty && !lieuEvent.isEmpty && dateEvent > Date()
    }
    var isValidFormEvent2: Bool {
        return !nomEvent.isEmpty && !descriptionEvent.isEmpty && !lieuEvent.isEmpty && priceGift > 0 && !participants.isEmpty && dateEvent > Date()
    }
    
    //MARK: -  Incrémenter budget
    
    func addBudget() {
        priceGift += 1
    }
    func minusBudget() {
        priceGift -= 1
    }
    
    // États pour la pression longue
    
    var incrementTimer: Timer?
    var decrementTimer: Timer?
    
    func startIncrementing() {
        // Commence à incrémenter toutes les 0.1 secondes
        incrementTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.addBudget()
        }
    }
    
    func stopIncrementing() {
        incrementTimer?.invalidate()
        incrementTimer = nil
    }
    
    func startDecrementing() {
        // Commence à décrémenter toutes les 0.1 secondes
        decrementTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if self.priceGift > 0 {
                self.minusBudget()
            } else {
                self.stopDecrementing()
            }
        }
    }
    
    func stopDecrementing() {
        decrementTimer?.invalidate()
        decrementTimer = nil
    }
    
    
    //MARK: -  Gestion des participants
    
    var name: String = ""
    var tel: String = ""
    var email: String = ""
    
    var isAddParticipant: Bool = false
    
    var isValidParticipant: Bool {
        return !name.isEmpty &&
        isValidEmail(email)
        //        &&isValidPhone(tel)
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
    var showName: Bool = false
    
    func findDrawForCurrentUser(eventId: UUID) async {
        do {
            let draw = try await service.fetchDraw(eventId: eventId)
            selectedPerson = draw.receiverName
            selectedPersonParticipantID = draw.receiverId
            showSnow = true
            
        } catch {
            print("Erreur tirage:", error)
        }
    }
    
    func resetTirage() {
        selectedPerson = nil
        selectedPersonParticipantID = nil
        showSnow = false
    }
    
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
            print("Events récupérés : \(eventsVM.count)")
        } catch {
            print("Erreur dans le chargement des events: \(error)")
        }
    }
    
    //Rejoindre un event
    
    var showValidationJoinModal : Bool = false
    var showInvalidCodeAlert : Bool = false
    
    func joinEvent(email: String, code: String) async {
        do {
            _ = try await service.joinEvent(email: email, code: code)
            print("Event rejoint")
            showValidationJoinModal = true
        } catch {
            print("Erreur lors de la tentative de rejoindre un event: \(error)")
            showInvalidCodeAlert = true
        }
    }
}








