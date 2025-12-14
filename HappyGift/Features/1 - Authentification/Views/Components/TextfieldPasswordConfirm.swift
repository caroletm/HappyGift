//
//  TextfieldPasswordConfirm.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI

struct TextFieldPasswordConfirm: View {
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM

        HStack {
            if authVM.isPasswordVisibleConfirm {
                TextField("Confirmez le mot de passe", text: $userVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 20)
                
                
            } else {
                SecureField("Confirmez le mot de passe", text: $userVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 20)
            }
            
            Button {
                authVM.isPasswordVisibleConfirm.toggle()
            }label: {
                Image(systemName: authVM.isPasswordVisibleConfirm ? "eye.slash" : "eye")
                    .foregroundColor(authVM.isPasswordVisibleConfirm ? .black : .gray)
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

#Preview {
    let userVM = UserViewModel()
    TextFieldPasswordConfirm()
        .environment(AuthViewModel(userVM: userVM))
        .environment(userVM)
}
