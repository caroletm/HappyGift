//
//  IconCard.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct IconCard: View {
    
    var image : String = ""
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.vert)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            Circle()
                .fill(Color.white)
                .frame(width : 87)
            Image(image)
                .resizable()
                .scaledToFit( )
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    IconCard(image : "carChristmas")
}
