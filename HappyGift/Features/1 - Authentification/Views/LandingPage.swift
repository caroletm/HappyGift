//
//  LandingPage.swift
//  HappyGift
//
//  Created by caroletm on 14/12/2025.
//

import SwiftUI

struct LandingPage : View {
    
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
        ZStack {
            Image(.landingPage2)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                VStack{
                    Image(.papaNoel)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 115, height: 115)
                    Text("My Secret Santa")
                        .font(.custom("Syncopate-Bold", size: 20))
                        .foregroundStyle(.white)
                        .padding(10)
                }.offset(y: -150)
     
                HStack{
                    Image(.bonhomme)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 116)
                        .padding(.trailing,30)
                    Button {
                        withAnimation {
                            authVM.showLanding = false
                            authVM.showLogin = true
                            authVM.clearError()
                        }
                        
                    }label:{
                        ZStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 190, height: 50)
                                .cornerRadius(50)
                            Text("Se connecter")
                                .foregroundStyle(.white)
                                .font(.custom("Syncopate-Bold", size: 14))
                            
                        }
                    }
                    
                }.offset(y: -60)
          
                HStack{
                    Button {
                        withAnimation {
                            authVM.showLanding = false
                            authVM.showSignIn = true
                            authVM.showLogin = false
                            authVM.clearError()
                        }
                    }label:{
                        ZStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 190, height: 50)
                                .cornerRadius(50)
                            Text("S'inscrire")
                                .foregroundStyle(.white)
                                .font(.custom("Syncopate-Bold", size: 14))
                            
                        }
                    }
                    .padding(.trailing,30)
                    Image(.boiteAuxLettres)
                }.offset(y: 90)
            }
        }
    }
}

#Preview {
    LandingPage()
        .environment(AuthViewModel(userVM: UserViewModel()))
}
