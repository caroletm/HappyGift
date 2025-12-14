//
//  TextfieldPassword.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI

struct TextFieldPassword: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM

        HStack {
            if authVM.isPasswordVisible {
                TextField("Votre mot de passe", text: $userVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 20)
                
            } else {
                SecureField("Votre mot de passe", text: $userVM.motDePasse)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 20)
            }
            
            Button {
                authVM.isPasswordVisible.toggle()
            }label: {
                Image(systemName: authVM.isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(authVM.isPasswordVisible ? .black : .gray)
            }
            .padding(.trailing, 5)
        }
        .padding(.leading, 20) 
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: 335, height : 45)
    }
}
