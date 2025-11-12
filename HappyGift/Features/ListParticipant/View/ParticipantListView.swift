//
//  ParticipantListView.swift
//  HappyGift
//
//  Created by apprenant152 on 12/11/2025.
//

import SwiftUI

struct ParticipantListView: View {
    @State var participantVM = ParticipantViewModel()
    var body: some View {
        VStack{
            Text("Liste des participants")
                .font(.custom("Syncopate-Bold", size: 20))
                .foregroundStyle(.vert)

            if participantVM.participants.isEmpty{
                    ParticipantEmptyView()
            }
            else{
                ForEach(participantVM.participants.enumerated(), id: \.1.id){ index, participant in
                    PartipantCellView(name: participant.name, tel: participant.tel, email: participant.email, bouleType: index % 2 == 0 ?  "BouleParticipantRed" : "BouleParticipantGreen")
                        .padding()
                    
                }
                Spacer()
               
            }
            ButtonParticipantCellView {
                participantVM.isAddParticipant = true
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.beige)
        .sheet(isPresented: $participantVM.isAddParticipant) {
            ParticipantFormCellView(participantVM: $participantVM)
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled(false)
                .presentationCompactAdaptation(.none)
            
        }
    }
}

#Preview {
    ParticipantListView()
}
