//
//  EventListViewModel.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import Foundation

@Observable
class EventListViewModel{
    
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
}
