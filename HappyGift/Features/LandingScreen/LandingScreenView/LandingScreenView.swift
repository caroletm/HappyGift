//
//  LandingScreenView.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
        ZStack {
            Color.vert
                .ignoresSafeArea()
            VStack {
                Text("Hello Name")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Image(.neigeFontDark)
                    .resizable()
                    .scaledToFit()
                
            }
        }
    }
}

#Preview {
    LandingScreenView()
}
