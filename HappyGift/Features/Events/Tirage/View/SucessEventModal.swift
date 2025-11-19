//
//  SucessEventModal.swift
//  HappyGift
//
//  Created by caroletm on 19/11/2025.
//

import SwiftUI

import SwiftUI

struct SucessEventModal: View {
    
    @Environment(EventViewModel.self) private var eventViewModel
    @Environment(NavigationViewModel.self) private var navigationViewModel
    @Binding var showModal : Bool
    
    var body: some View {
        ZStack {
            Color(.beige)
                .ignoresSafeArea()
            VStack (spacing: 20){
                Rectangle()
                    .frame(width: 52, height: 5)
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    .padding(.top, 10)
                Spacer()
                Image("modale2")
                Text("Ton évènement a bien été créé avec succès ! \nLes participants recevront leurs invitations")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .padding(.bottom, 20)
                Button {
//                    eventViewModel.createEvent()
                    showModal = false
                    eventViewModel.resetFormEvent()
                    navigationViewModel.path = NavigationPath()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black)
                            .frame(width: 250, height: 60)
                        Text("C'est noté !")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.beige)
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    SucessEventModal(showModal: .constant(false))
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
