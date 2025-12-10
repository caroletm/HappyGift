//
//  UservIEWmODEL.swift
//  HappyGift
//
//  Created by caroletm on 08/12/2025.
//

import Foundation
import SwiftUI
import Observation

@Observable

class UserViewModel {
    
    //MARK: - DataUser
    var nomUtilisateur: String = ""
    var email: String = ""
    var motDePasse: String = ""
    var motDePasseConfirm: String = ""
    var image : String? = nil
    var nom = ""
    var prenom = ""
    
    //MARK: - Date
    func dateFormatter(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
