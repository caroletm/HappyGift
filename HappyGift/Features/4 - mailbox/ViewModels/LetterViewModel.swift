//
//  LetterViewModel.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

@Observable
class LetterViewModel {
    
    //MARK: - Data des letters
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    var mailboxData: [Letter] = [letterFromBob, letterFromAlice, letterFromSarah]
    var mailboxSentData: [Letter] = []
    var lastLetterIsRead: Bool = false
    var newLetterinMailbox: Bool = false

    //MARK: - Affichage des enveloppes dans mailbox

    /// Commence sur la dernière lettre (index max)
    var currentIndex: Int {
        max(0, mailboxData.count - 1)
    }

    var mailboxSlots: [Letter?] {
        (0..<4).map { i in
            i < mailboxData.count ? mailboxData[i] : nil
        }
    }
    
    var lastFourSlots: [Letter?] {
        let last = mailboxData.suffix(4)
        return Array(last)
    }

    var colorCycle = ["env_rouge", "env_rose", "env_vert"]

    func envelopeImage(for index: Int) -> String {
        index < mailboxData.count ? colorCycle[index % colorCycle.count] : "env_gray"
    }
    
    //MARK: - Ecrire une lettre
    
    var userMessage : String = ""
    var expediteur : UUID? = nil
    var signature : String = ""
    var destinataire : UUID? = nil
    
    func sendLetter() {
        guard let to = destinataire else {
            print("❌ Pas de destinataire, lettre non envoyée.")
            return
        }

        guard let from = expediteur else {
            print("❌ Pas d’expéditeur, lettre non envoyée.")
            return
        }

        guard userMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false else {
            print("❌ Message vide.")
            return
        }

        let newLetter = Letter(
            id: UUID(),
            destinataire: to,
            userMessage: userMessage,
            expediteur: from,
            signature: signature,
            type: .fromUserToFriend
        )

        mailboxData.append(newLetter)

        /// Reset après envoi (optionnel)
        userMessage = ""
        signature = ""
        destinataire = nil
    }
}


