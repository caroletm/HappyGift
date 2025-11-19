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

    var mailboxIsEmpty : Bool = false
    
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
    var backupDate: Date = {
        var components = DateComponents()
        components.year = 2025
        components.month = 12
        components.day = 15
        components.hour = 20
        components.minute = 00
        return Calendar.current.date(from: components)!
    }()
    
    var formattedBackupTimeLeft: (days: String, hours: String, minutes: String) {
        let timeInterval = max(backupDate.timeIntervalSince(Date()), 0)
           let totalMinutes = Int(timeInterval / 60)
           let days = totalMinutes / (24 * 60)
           let hours = (totalMinutes % (24 * 60)) / 60
           let minutes = totalMinutes % 60
           
           return (
               days: String(format: "%02d", days),
               hours: String(format: "%02d", hours),
               minutes: String(format: "%02d", minutes)
           )
    }
    
    // Mise à jour du temps
     func updateTimeLeft() {
        let now = Date()
        timeLeft = max(targetDate.timeIntervalSince(now), 1)
    }
    
     func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateTimeLeft()
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}


