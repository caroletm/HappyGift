//
//  buttonText.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct ButtonText: View {
    
    var text: String
    var width : CGFloat
    
    var body: some View {
    
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: width, height: 50)
                .cornerRadius(50)
            Text(text)
                .foregroundStyle(.white)
                .font(.custom( "Syncopate-Bold", size: 16))
            
        }
    }
}

#Preview {
    ButtonText(text: "OK", width: 150)
}
