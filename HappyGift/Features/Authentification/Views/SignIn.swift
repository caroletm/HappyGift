//
//  LoginPage.swift
//  HappyGift
//
//  Created by caroletm on 23/11/2025.
//

import SwiftUI

struct SignInPage: View {
    @Environment(AuthViewModel.self) var authVM
    
    @State var isPasswordVisible: Bool = false
    @State var isPasswordConfirmVisible: Bool = false
    
    var body: some View {
        
        ZStack {
            Image(.backgroundAuth)
                .resizable()
                .scaledToFill()
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
                    .frame(height: 30)
                HStack {
                    Text("Email")
                        .font(.custom("Syncopate-Bold", size: 10))
                        .foregroundStyle(.white)
                    Spacer()
                    TextFieldEmail()
                }.padding(.horizontal)
                    .padding(.vertical, 8)
                HStack {
                    Text("Mot de passe")
                        .font(.custom("Syncopate-Bold", size: 10))
                        .foregroundStyle(.white)
                    Spacer()
                    TextFieldPassword(isPasswordVisible: $isPasswordVisible)
                }.padding(.horizontal)
                    .padding(.vertical, 8)
                
                
                HStack {
                    Text("Confirmer mot de passe")
                        .font(.custom("Syncopate-Bold", size: 10))
                        .foregroundStyle(.white)
                    Spacer()
                    TextFieldPasswordConfirm(isPasswordVisible: $isPasswordConfirmVisible)
                }.padding(.horizontal)
                    .padding(.vertical, 8)
                
                Spacer()
                    .frame(height: 40)
                
                Button {
                    //
                }label:{
                    ButtonText(text: "Se connecter", width: 150)
                }
                HStack {
                    Text("Déjà un compte?")
                        .font(.system(size: 14, weight:.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                    
                    Button {
                        authVM.isAuthenticated = true
                    }label:{
                        Text("Se connecter")
                            .font(.system(size: 14, weight:.bold))
                            .underline()
                            .foregroundStyle(.white)
                    }
                }
            
                Spacer()
                    .frame(height: 200)
            }
        }
    }
}
#Preview {
    SignInPage()
        .environment(AuthViewModel())
}
