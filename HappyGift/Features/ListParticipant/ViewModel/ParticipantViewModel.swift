//
//  ParticipantViewModel.swift
//  HappyGift
//
//  Created by apprenant152 on 12/11/2025.
//

import Foundation

@Observable
class ParticipantViewModel{
    
    var name: String = ""
    var tel: String = ""
    var email: String = ""
    
    var isAddParticipant: Bool = false
    
    var participants : [Participant] = []
    
    var tirageResult: [UUID: UUID] = [:]

    func addParticipant(){
        let participant  = Participant(name: name, tel: tel, email: email)
        participants.append(participant)
    }
    
    func reset(){
        name = ""
        tel = ""
        email = ""
    }
    
    
    // MARK: - Tirage Logic
    func doTirage() {
        guard participants.count > 1 else { return }
        
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
    }
    
    func getDrawnPerson(for participantName: String) -> Participant? {
        guard let current = participants.first(where: { $0.name == participantName }),
              let drawnID = tirageResult[current.id],
              let drawn = participants.first(where: { $0.id == drawnID }) else {
            return nil
        }
        return drawn
    }
}



