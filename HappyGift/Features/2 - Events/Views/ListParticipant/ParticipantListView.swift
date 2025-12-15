//
//  ParticipantListView.swift
//  HappyGift
//
//  Created by apprenant152 on 12/11/2025.
//

import SwiftUI

struct ParticipantListView: View {
    
    @Environment(EventViewModel.self) private var eventVM

    @State var showModal = false
    @State var showAlertDelete: Bool = false
    @State private var participantIndexToDelete: Int?
        
    var body: some View {
                
        VStack{
            Text("Liste des participants")
                .font(.custom("Syncopate-Bold", size: 20))
                .foregroundStyle(.vertDark)
            Text("Il faut au moins 3 participants pour lancer un tirage")
                .font(.system(size: 14))
                .padding(20)
            
            if eventVM.participants.isEmpty{
                ParticipantEmptyView()
            } else {
                ForEach(Array(eventVM.participants.enumerated()), id: \.offset) { (index, participant) in
                    PartipantCellView(
                                 name: participant.name,
                                 tel: participant.telephone,
                                 email: participant.email,
                                 bouleType: index % 2 == 0 ? "BouleParticipantRed" : "BouleParticipantGreen",
                                 onDelete: {
                                     participantIndexToDelete = index
                                     showAlertDelete = true
                                 }
                             )
                    .padding()
                }
            }
    
            Spacer()
            
            ButtonParticipantCellView(title: "Ajouter") {
                showModal = true
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.beige)
        .sheet(isPresented: $showModal ) {
            ParticipantFormCellView(showModal: $showModal)
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled(false)
                .presentationCompactAdaptation(.none)
        }
        .alert("Retirer ce participant ?", isPresented: $showAlertDelete) {
            Button("Annuler", role: .cancel) {
                participantIndexToDelete = nil
            }
            Button("OK", role: .destructive) {
                if let index = participantIndexToDelete,
                   index < eventVM.participants.count {
                    eventVM.participants.remove(at: index)
                }
                participantIndexToDelete = nil
            }
        } message: {
            Text("Retirer ce participant de l'évènement ?")
        }
    }
}

#Preview {
    ParticipantListView()
        .environment(EventViewModel())
}

