//
//  ParticipantListView.swift
//  HappyGift
//
//  Created by apprenant152 on 12/11/2025.
//

import SwiftUI

struct ParticipantListView: View {
    
    @Environment(ParticipantViewModel.self) private var participantVM
    @State var showModal = false
    
    var body: some View {
        
        @Bindable var participantVM = ParticipantViewModel()
        
        VStack{
            Text("Liste des participants")
                .font(.custom("Syncopate-Bold", size: 30))
                .foregroundStyle(.vert)
            
            if participantVM.participants.isEmpty{
                ParticipantEmptyView()
                
            } else {
//                ForEach(participantVM.participants.enumerated(), id: \.1.id){ index, participant in
//                    PartipantCellView(name: participant.name, tel: participant.tel, email: participant.email, bouleType: index % 2 == 0 ?  "BouleParticipantRed" : "BouleParticipantGreen")
//                        .padding()
//                }
            }
            
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
        .environment(ParticipantViewModel())
}
