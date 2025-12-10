//
//  SucessLetterModal.swift
//  HappyGift
//
//  Created by caroletm on 19/11/2025.
//

import SwiftUI

struct SucessLetterModal: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
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
                Image("modale")
                Text("Ta lettre a été envoyée avec succès !")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .padding(.bottom, 20)
                Button {
                    showModal = false
                    navigationVM.path = NavigationPath()
                    
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
    SucessLetterModal(showModal: .constant(false))
        .environment(NavigationViewModel())
}

