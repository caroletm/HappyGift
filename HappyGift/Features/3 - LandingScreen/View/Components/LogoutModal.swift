//
//  LogoutModal.swift
//  HappyGift
//
//  Created by caroletm on 10/12/2025.
//

import SwiftUI

struct LogoutModal: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    @Environment(AuthViewModel.self) var authVM
    
    @Binding var showLogoutModal : Bool
    
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
                Text("Deconnexion")
                    .font(.custom("Syncopate-Bold", size: 20))
                Spacer()
                Image(.maisonsRose)
                Text("Etes vous sur.e de vouloir quitter l'application?")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .padding(.bottom, 20)
                Button {
                    showLogoutModal = false
                    authVM.logout()
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black)
                            .frame(width: 250, height: 60)
                        Text("Se deconnecter")
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
    let userVM = UserViewModel()
    LogoutModal(showLogoutModal: .constant(false))
        .environment(NavigationViewModel())
        .environment(AuthViewModel(userVM : userVM))
}
