//
//  LandingScreenViewModel.swift
//  HappyGift
//
//  Created by Carla on 12/11/2025.
//


import Foundation
import SwiftUI

class LandingScreenViewModel: Observable {
    var mailboxIsEmpty : Bool = false
    
    //MARK: - Compte à rebours
    
    let targetDate: Date
    var timeLeft: TimeInterval = 0
    private var timer: Timer?
    
    init(targetDate: Date) {
        self.targetDate = targetDate
        updateTimeLeft()
        startTimer()
    }
    
    // Temps restant
    var formattedTimeLeft: (days: String, hours: String, minutes: String) {
        let totalMinutes = Int(timeLeft / 60)
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
    private func updateTimeLeft() {
        let now = Date()
        timeLeft = max(targetDate.timeIntervalSince(now), 0)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            self.updateTimeLeft()
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
