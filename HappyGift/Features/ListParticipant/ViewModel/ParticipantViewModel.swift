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
    
    
    func addParticipant(){
        let participant  = Participant(name: name, tel: tel, email: email)
        participants.append(participant)
    }
    
    func reset(){
        name = ""
        tel = ""
        email = ""
    }
}
