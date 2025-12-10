//
//  LoginPage.swift
//  HappyGift
//
//  Created by caroletm on 23/11/2025.
//

import SwiftUI

struct LoginPage: View {
    @Environment(AuthViewModel.self) var authVM
    
    @State var isPasswordConfirmVisible: Bool = false
    
    var body: some View {
    
        
        @Bindable var authVM = authVM
        
        ZStack {
            Image(.backAuth2)
                .ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                Image(.papaNoel)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 115, height: 115)
                Text("My Secret Santa")
                    .font(.custom("Syncopate-Bold", size: 20))
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
                    .frame(height: 50)
                
                TextFieldEmail()
                Spacer()
                    .frame(height: 15)
                TextFieldPassword()
                
                Spacer()
                    .frame(height: 50)
                
                Button {
                    authVM.isAuthenticated = true
                }label:{
                    ButtonText(text: "Se connecter", width: 335)
                }
                HStack {
                    Text("Pas de compte?")
                        .font(.system(size: 14, weight:.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                    
                    Button {
                        //
                    }label:{
                        Text("S'inscrire")
                            .font(.system(size: 14, weight:.bold))
                            .underline()
                            .foregroundStyle(.white)
                    }
                }
            
                Spacer()
                    .frame(height: 250)
            }
        }
    }
}
#Preview {
    LoginPage()
        .environment(AuthViewModel(userVM: UserViewModel()))
}
