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
                .font(.custom("The Santa", size: 36))
                .foregroundStyle(.vert)
            
            if eventVM.participants.isEmpty{
                ParticipantEmptyView()
            } else {
                ForEach(Array(eventVM.participants.enumerated()), id: \.1.id) { index, participant in
                    PartipantCellView(
                        name: participant.name,
                        tel: participant.tel,
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
