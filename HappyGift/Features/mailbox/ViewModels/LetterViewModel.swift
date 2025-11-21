//
//  LetterViewModel.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

@Observable
class LetterViewModel {
    var userMessage = ""
    var signature = ""
    
    //MARK: - Mailbox
    
    var letterCount : Int {
        userStandard.letters.count
    }
    
    var enveloppes : [String] {
        let couleurs = ["env_rouge", "env_rose", "env_vert"]
        var result : [String] = []
        for i in 0..<7 {
            result.append(couleurs[i % couleurs.count])
        }
        return result
    }
}
