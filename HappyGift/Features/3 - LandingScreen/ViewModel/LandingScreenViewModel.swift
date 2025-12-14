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
    
    //MARK: - Compte à rebours
    
    var eventVM : EventViewModel
    var targetDate: Date {
        guard let lastEventDate = eventVM.eventsVM.last?.date else { return Date() }
        return lastEventDate
    }
    var timeLeft: TimeInterval = 0
    private var timer: Timer?
    
    init(eventVM : EventViewModel) {
        self.eventVM = eventVM
        updateTimeLeft()
        startTimer()
    }
    
    var nextEventDate: Date? {
        // On récupère tous les événements dont la date est après maintenant
        let upcomingEvents = eventVM.eventsVM.filter { $0.date > Date() }
        
        // On prend celui avec la date la plus proche
        return upcomingEvents.min(by: { $0.date < $1.date })?.date
    }
    
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

}


