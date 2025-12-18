//
//  LoginPage.swift
//  HappyGift
//
//  Created by caroletm on 23/11/2025.
//

import SwiftUI

struct SignInPage: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    @State var isPasswordVisible: Bool = false
    @State var isPasswordConfirmVisible: Bool = false
    
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case password
        case name
        case passwordConfirm
    }
    
    var body: some View {
        
        ZStack {
            Color.vert
                .ignoresSafeArea(edges: .all)
            Image(.backAuth2)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            VStack (spacing : 10) {
                Spacer()
                Image(.papaNoel)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 115, height: 115)
                Text("My Secret Santa")
                    .font(.custom("Syncopate-Bold", size: 20))
                    .foregroundStyle(.white)
                    .padding()
                
                if let errorMessage = authVM.errorMessage {
                    Text(errorMessage)
                        .padding(20)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.rouge)
                }
                
                TextFieldEmail()
                    .focused($focusedField, equals: .email)
                TextFieldName()
                    .focused($focusedField, equals: .name)
                TextFieldPassword()
                    .focused($focusedField, equals: .password)
                TextFieldPasswordConfirm()
                    .focused($focusedField, equals: .passwordConfirm)
                
                Spacer()
                    .frame(height: 20)
                
                Button {
                    Task {
                        await authVM.signUp()
                    }
                }label:{
                    ButtonText(text: "S'inscrire", width: 335)
                }
                HStack {
                    Text("Déjà un compte?")
                        .font(.system(size: 14, weight:.bold))
                        .foregroundStyle(.white)
                        .padding(.vertical)
                    
                    Button {
                        withAnimation {
                            authVM.showSignIn = false
                            authVM.showLogin = true
                        }
                    }label:{
                        Text("Connectez vous")
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
        .environment(userVM)
}
