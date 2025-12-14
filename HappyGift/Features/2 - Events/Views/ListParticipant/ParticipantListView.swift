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
                ForEach(eventVM.participants.indices, id: \.self) { index in
                    let participant = eventVM.participants[index]
                    PartipantCellView(
                        name: participant.name,
                        tel: participant.telephone,
                        email: participant.email,
                        bouleType: index % 2 == 0 ? "BouleParticipantRed" : "BouleParticipantGreen"
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
    }
}

#Preview {
    ParticipantListView()
        .environment(EventViewModel())
}
