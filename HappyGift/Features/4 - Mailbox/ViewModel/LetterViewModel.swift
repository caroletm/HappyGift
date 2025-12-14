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
    
    var mailboxData: [LetterDTO] = []
    var mailboxSentData: [LetterDTO] = []
    var lastLetterIsRead: Bool = false
    var newLetterinMailbox: Bool = false

    //MARK: - Affichage des enveloppes dans mailbox

    /// Commence sur la dernière lettre (index max)
    var currentIndex: Int {
        max(0, mailboxData.count - 1)
    }
    
    var lastLetter: LetterDTO? {
          mailboxData.first  // Comme le backend trie par date DESC, first = plus récente
      }

    var mailboxSlots: [LetterDTO?] {
        (0..<4).map { i in
            i < mailboxData.count ? mailboxData[i] : nil
        }
    }
    
    
    var lastFourSlots: [LetterDTO?] {
        let last = mailboxData.prefix(4)
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
    
    func resetLetterForm(){
        userMessage = ""
        signature = ""
        destinataire = nil
    }
    
    func sendLetter(eventId: UUID) async {
        let newLetter =
        LetterCreateDTO(
            message: userMessage,
            signature: signature,
            typeLetter: .fromUserToFriend,
            eventId: eventId,
        )
        do {
            let letterCreated = try await service.createLetter(newLetter)
            mailboxSentData.append(letterCreated)
            
            await fetchLetters()
            
            resetLetterForm()
        }catch {
            print("erreur dans l'envoi de la lettre : \(error)")
        }
    }
    
   
    
    //MARK: - CallAPI
    
    let service = LetterService()
    
    //Recupérer les lettres
    func fetchLetters() async {
            do {
                mailboxData = try await service.getAllLetters()
                print("Lettres récupérées : \(mailboxData.count)")
                if let lastLetter = lastLetter {
                    print("Dernière lettre : \(lastLetter.signature) - \(lastLetter.date ?? Date())")
                }
            } catch {
                print("Erreur dans le chargement des lettres: \(error)")
            }
        }
}


