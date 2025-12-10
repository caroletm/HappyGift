//
//  TextfieldEmail.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import SwiftUI

struct TextFieldEmail: View {
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        
        @Bindable var userVM = userVM

        TextField("Votre email", text: $userVM.email)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(10)
            .font(.system(size: 14))
            .frame(width: 335, height : 45)
         
    }
}

#Preview {
    let userVM = UserViewModel()
    TextFieldEmail()
        .environment(userVM)
}
