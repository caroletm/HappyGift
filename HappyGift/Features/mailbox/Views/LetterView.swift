//
//  LetterView.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

public struct LetterView: View {
    
    var userMessage: String
    var signature: String
    var height: CGFloat
    
    public var body: some View {
        ZStack(alignment: .bottom) { // aligné en bas
            Rectangle()
                .fill(Color.beige)
                .shadow(color: .black.opacity(0.15), radius: 1, x: 0, y: 1)
                .frame(width: 330, height: height)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Cher Père Noël,")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    
                    Text(userMessage)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                        .lineSpacing(5)
                    
                   Spacer(minLength: 10)
                    
                    HStack {
                        Spacer()
                        Text(signature)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .padding(20)
            }
            .frame(width: 330, height: height, alignment: .bottom) // le bas reste collé
        }
    }
}

#Preview {
    LetterView(userMessage: "Cette année, j'ai été très sage et j'ai aidé mes amis et ma famille. J'aimerais beaucoup recevoir un vélo rouge avec un panier, et si tu as de la place, quelques livres d'aventure .\n\nMerci beaucoup et joyeux Noël !", signature: "Alice", height: 300)
  
}
