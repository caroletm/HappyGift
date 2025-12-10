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
            Image(.backAuth2)
                .ignoresSafeArea(edges: .all)
            VStack (spacing : 5) {
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
                TextFieldName()
                TextFieldPassword()
                TextFieldPasswordConfirm()
                
                Spacer()
                    .frame(height: 50)
                
                Button {
                    //
                }label:{
                    ButtonText(text: "Se connecter", width: 335)
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
    let userVM = UserViewModel()
    SignInPage()
        .environment(AuthViewModel(userVM: userVM))
}
