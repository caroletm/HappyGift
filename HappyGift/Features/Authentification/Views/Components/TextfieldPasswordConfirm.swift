//
//  TextfieldPasswordConfirm.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI

struct TextFieldPasswordConfirm: View {
    @Environment(AuthViewModel.self) var authVM
    
    @Binding var isPasswordVisible: Bool
    
    var body: some View {
        
        @Bindable var authVM = authVM
        
        HStack {
            if authVM.isPasswordVisible {
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
                isPasswordVisible.toggle()
            }label: {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(isPasswordVisible ? .black : .gray)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: 280)
    }
}

#Preview {
    TextFieldPasswordConfirm(isPasswordVisible: .constant(false))
        .environment(AuthViewModel())
}
