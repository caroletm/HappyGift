//
//  TirageView.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import SwiftUI

struct TirageView: View {
    var body: some View {
        ZStack {
            Color.vert
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Shake your phone to see who you got!")
                    .font(.custom("Syncopate-Regular", size: 40))
                    .foregroundColor(.white)
                
                Image("SnowGlobe")
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 278, height: 63)
                .background(.black.opacity(0.85))
                .cornerRadius(30)
                
            }
        }
    }
}

#Preview {
    TirageView()
}
