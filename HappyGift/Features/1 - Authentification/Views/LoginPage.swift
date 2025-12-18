//
//  LoginPage.swift
//  HappyGift
//
//  Created by caroletm on 23/11/2025.
//

import SwiftUI

struct LoginPage: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    @State var isPasswordConfirmVisible: Bool = false
    
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case password
    }
    
    var body: some View {
        
        
        @Bindable var authVM = authVM
        
        ZStack {
//            Color.vert
//                .ignoresSafeArea(edges: .all)
            Image(.backAuth2)
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
                    .padding(10)
                
                if let errorMessage = authVM.errorMessage {
                    Text(errorMessage)
                        .padding(10)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.rouge)
                }else {
                    Spacer()
                        .frame(height: 20)
                }
                
                TextFieldEmail()
                    .focused($focusedField, equals: .email)
                Spacer()
                    .frame(height: 15)
                TextFieldPassword()
                    .focused($focusedField, equals: .password)
                
                Spacer()
                    .frame(height: 50)
                
                Button {
                    focusedField = nil
                    Task { await authVM.signIn()}
                    
                }label:{
                    ButtonText(text: "Se connecter", width: 335)
                }
                HStack {
                    Text("Pas de compte?")
                        .font(.system(size: 14, weight:.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                    
                    Button {
                        withAnimation {
                            authVM.showSignIn = true
                            authVM.showLogin = false
                        }
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
    let userVM = UserViewModel()
    LoginPage()
        .environment(AuthViewModel(userVM: userVM))
        .environment(userVM)
}
