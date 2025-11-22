//
//  LetterViewModel.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

@Observable
class LetterViewModel {

    var user = userStandard

    /// Commence sur la dernière lettre (index max)
    var currentIndex: Int = max(0, userStandard.letters.count - 1)
    
    var lastFourSlots: [Letter?] {
        Array(mailboxSlots.suffix(4))
    }

    var mailboxSlots: [Letter?] {
        (0..<4).map { i in
            i < user.letters.count ? user.letters[i] : nil
        }
    }

    var colorCycle = ["env_rouge", "env_rose", "env_vert"]

    func envelopeImage(for index: Int) -> String {
        index < user.letters.count
            ? colorCycle[index % colorCycle.count]
            : "env_gray"
    }
}
