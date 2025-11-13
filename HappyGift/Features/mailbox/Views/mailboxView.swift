//
//  mailbox2View.swift
//  HappyGift
//
//  Created by alize suchon on 13/11/2025.
//

import SwiftUI

struct mailboxView: View {
    
    @State private var enveloppes = ["env_rouge", "env_rose", "env_vert", "env_rouge", "env_rose", "env_vert", "env_rouge"]
    @State private var currentIndex: Int = 3
    @State private var dragEnv: CGSize = .zero
    
    
    var body: some View {
        
        ZStack{
            Color(.beige)
                .ignoresSafeArea()
            
            VStack(spacing: 50){
                
                Text("Boîte aux lettres")
                    .font(.custom("Syncopate-Bold", size: 30))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                Spacer()
                
                ZStack {
                    ForEach(enveloppes.indices, id: \.self) { index in
                        let position = CGFloat(index - currentIndex)
                        let size = 360 - abs(position) * 10 //reduction taille env
                        
                        if abs(position) <= 3 {
                            Image(enveloppes[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: size, height: size * 0.66)
                                .offset(y: position * 60 + (index == currentIndex ? dragEnv.height : 0)) //Decalage env de 60 px
                                .scaleEffect(index == currentIndex ? 1.05 : 1.0)
                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
                                .zIndex(-abs(position)) // enveloppe du du milieu
                                .animation(.spring(response: 0.4, dampingFraction: 0.8), value: currentIndex)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragEnv = value.translation
                            }
                            .onEnded { value in
                                if value.translation.height < -50 {
                                    // swipe haut
                                    if currentIndex < enveloppes.count - 1 {
                                        currentIndex += 1
                                    }
                                } else if value.translation.height > 50 {
                                    // swipe bas
                                    if currentIndex > 0 {
                                        currentIndex -= 1
                                    }
                                }
                                dragEnv = .zero
                            }
                    )
                }
                Spacer()
            }
        }
    }
}

#Preview {
    mailboxView()
}
