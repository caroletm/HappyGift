//
//  TextfieldPasswordConfirm.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI

struct TextFieldPasswordConfirm: View {
    @Environment(AuthViewModel.self) var authVM
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        HStack {
            if authVM.isPasswordVisibleConfirm {
                TextField("Confirmez le mot de passe", text: $authVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
            } else {
                SecureField("Confirmez le mot de passe", text: $authVM.motDePasseConfirm)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button {
                authVM.isPasswordVisible.toggle()
            }label: {
                Image(systemName: authVM.isPasswordVisibleConfirm ? "eye.slash" : "eye")
                    .foregroundColor(authVM.isPasswordVisibleConfirm ? .black : .gray)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: 335, height : 45)
    }
}

#Preview {
    TextFieldPasswordConfirm()
        .environment(AuthViewModel(userVM: UserViewModel()))
}
