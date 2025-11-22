//
//  LetterView.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

public struct LetterView: View {
    
    var signature: String = "Alice"
    var height: CGFloat = 300
    
    var letter : Letter
    
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
                    
                    Text(letter.userMessage)
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                        .lineSpacing(5)
                    
                   Spacer(minLength: 10)
                    
                    HStack {
                        Spacer()
                        Text(letter.signature)
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
    LetterView(letter: letterFromBob)
  
}
