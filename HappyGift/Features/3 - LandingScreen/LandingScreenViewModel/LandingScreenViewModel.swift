//
//  LandingScreenViewModel.swift
//  HappyGift
//
//  Created by Carla on 12/11/2025.
//


import Foundation
import SwiftUI

@Observable
class LandingScreenViewModel {

//    var mailboxIsEmpty : Bool = false
    
    //MARK: - Compte à rebours
    
    var eventVM : EventViewModel
    var targetDate: Date {
        eventVM.eventsVM.last!.dateEvent
    }
    var timeLeft: TimeInterval = 0
    private var timer: Timer?
    
    init(eventVM : EventViewModel) {
        self.eventVM = eventVM
        updateTimeLeft()
        startTimer()
    }
    
//    var backupDate : Date {
//        eventVM.eventsVM.last!.dateEvent
//    }
    
    var nextEventDate: Date? {
        // On récupère tous les événements dont la date est après maintenant
        let upcomingEvents = eventVM.eventsVM.filter { $0.dateEvent > Date() }
        
        // On prend celui avec la date la plus proche
        return upcomingEvents.min(by: { $0.dateEvent < $1.dateEvent })?.dateEvent
    }
    
//    // Temps restant
//    func formattedTimeLeft(until date: Date) -> (days: String, hours: String, minutes: String) {
//        let totalMinutes = Int(timeLeft / 60)
//        let days = totalMinutes / (24 * 60)
//        let hours = (totalMinutes % (24 * 60)) / 60
//        let minutes = totalMinutes % 60
//        
//        return (
//            days: String(format: "%02d", days),
//            hours: String(format: "%02d", hours),
//            minutes: String(format: "%02d", minutes)
//        )
//    }
    
    // 15 décembre 2025 à 20h00
//    var backupDate: Date = {
//        var components = DateComponents()
//        components.year = 2025
//        components.month = 12
//        components.day = 15
//        components.hour = 20
//        components.minute = 00
//        return Calendar.current.date(from: components)!
//    }()
    
    var formattedBackupTimeLeft: (days: String, hours: String, minutes: String, seconds: String) {
        let timeInterval = max(nextEventDate?.timeIntervalSince(Date()) ?? 0, 0)
        
        let totalSeconds = Int(timeInterval)
        let days = totalSeconds / (24 * 3600)
        let hours = (totalSeconds % (24 * 3600)) / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return (
            days: String(format: "%02d", days),
            hours: String(format: "%02d", hours),
            minutes: String(format: "%02d", minutes),
            seconds: String(format: "%02d", seconds)
        )
    }
    
    // Mise à jour du temps
     func updateTimeLeft() {
        let now = Date()
        timeLeft = max(targetDate.timeIntervalSince(now), 1)
    }
    
//     func startTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
//            self.updateTimeLeft()
//        }
//    }
    
    deinit {
        timer?.invalidate()
    }
    
    
//    var backupDate: Date = Date().addingTimeInterval(3600)
    var timeNow: Date = Date() // propriété qui va déclencher les mises à jour
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.timeNow = Date() // met à jour la propriété observable
        }
    }
    
//    func stopTimer() {
//        timer?.invalidate()
//        timer = nil
//    }
    
//    deinit {
//        timer?.invalidate()
//    }
}


