//
//  envelopeView2.swift
//  HappyGift
//
//  Created by caroletm on 22/11/2025.
//

import SwiftUI

struct envelopeView2: View {
    
    var imageName: String
    var size: CGFloat
    var yOffset: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size * 0.66)
            .offset(y: yOffset)
            .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
    }
}

#Preview {
    envelopeView2(imageName: "env_rouge", size: 300, yOffset: 0)
}


