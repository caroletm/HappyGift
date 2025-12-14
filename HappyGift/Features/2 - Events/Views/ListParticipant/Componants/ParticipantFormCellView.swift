//
//  ParticipantFormCellView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct ParticipantFormCellView: View {

    @Environment(EventViewModel.self) private var eventVM
    @Binding var showModal: Bool
    @State var showAlert = false

    var body: some View {
        
        @Bindable var eventVM = eventVM
        
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Ajouter un participant")
                    .padding(.top)
                    .font(.custom("Syncopate-Bold", size: 16))
                    .foregroundStyle(Color("beige"))
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("N'oublie pas de t'ajouter !")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color("beige"))
                    .frame(maxWidth: .infinity, alignment: .center)
                 
                VStack(spacing: 20) {
                    textfield(title: "nom", data: $eventVM.name)
//                    textfield(title: "tel", data: $eventVM.tel)
                    textfield(title: "email", data: $eventVM.email)
                }
                .padding()

                ButtonParticipantCellView(title: "Ajouter") {
                    if eventVM.isValidParticipant {
                        eventVM.addParticipant()
                        showModal = false
                        eventVM.reset()
                        print(eventVM.participants.count)
                    }else{
                        showAlert = true
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("vert"))

        .alert("Ajout impossible", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Vous n'avez pas bien rempli tous les champs!")
        }
    }

    func textfield(title: String, data: Binding<String>) -> some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.system( size: 16))
                .fontWeight(.bold)
                .foregroundStyle(Color("beige"))
                .frame(width: 70, alignment: .leading)

            TextField("", text: data)
                .padding(.horizontal, 10)
                .frame(height: 40)
                .background(Color("beige"))
                .cornerRadius(10)
                .foregroundColor(Color("vertDark"))
                .font(.system(size: 14))
        }
    }
}


#Preview {
    ParticipantFormCellView(showModal: .constant(false))
        .environment(EventViewModel())
}
