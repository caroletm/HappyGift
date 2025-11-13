//
//  TirageViewModel.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import Foundation
import SwiftUI
import Combine

@Observable
@MainActor
class TirageViewModel {
  var showSnow = false
    var selectedName: String? = nil
    
    let participantVM: ParticipantViewModel
        let currentUserName: String
        
        init(participantVM: ParticipantViewModel, currentUserName: String) {
            self.participantVM = participantVM
            self.currentUserName = currentUserName
        }
        
        func handleShake() {
            participantVM.doTirage()
            
            if let drawn = participantVM.getDrawnPerson(for: currentUserName) {
                withAnimation(.easeOut(duration: 1.0)) {
                    showSnow = true
                    selectedName = drawn.name
                }
            }
        }
    }
