//
//  mailbox3View.swift
//  HappyGift
//
//  Created by caroletm on 22/11/2025.
//

import SwiftUI

import SwiftUI

struct mailbox3View: View {
    @Environment(NavigationViewModel.self) var navVM
    @Environment(LetterViewModel.self) var letterVM
    
    @State private var dragEnv: CGSize = .zero
    @State private var currentIndex: Int = 0 // 👈 initialisé dans onAppear
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.beige).ignoresSafeArea()
                
                VStack(spacing: 50) {
                    
                    Text("Boîte aux lettres")
                        .font(.custom("Syncopate-Bold", size: 30))
                        .foregroundColor(.black)
                        .padding(.top, 20)
                        .zIndex(999)
                    
                    Spacer()
                    
                    ZStack {
                        let slots = letterVM.lastFourSlots
                        
                        ForEach(slots.indices.sorted(by: { abs($0 - currentIndex) > abs($1 - currentIndex) }), id: \.self) { index in
                            
                            let position = CGFloat(index - currentIndex)
                            let size = 360 - abs(position) * 15
                            let letter = slots[index]
                            let y = position * 70 + dragEnv.height
                            
                            if index == currentIndex {
                                Button {
                                    if let selectedLetter = letter {
                                        navVM.path.append(AppRoute.enveloppeView(letter: selectedLetter))
                                    }
                                } label: {
                                    envelopeView2(
                                        imageName: letterVM.envelopeImage(for: index),
                                        size: size,
                                        yOffset: y
                                    )
                                    .scaleEffect(1.05)
                                    .zIndex(10)
                                }
                                .buttonStyle(.plain)
                                
                            } else {
                                envelopeView2(
                                    imageName: letterVM.envelopeImage(for: index),
                                    size: size,
                                    yOffset: y
                                )
                                .zIndex(Double(-abs(position)))
                            }
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { dragEnv = $0.translation }
                            .onEnded { value in
                                
                                if value.translation.height < -50 { // vers haut
                                    if currentIndex < letterVM.lastFourSlots.count - 1 {
                                        currentIndex += 1
                                    }
                                } else if value.translation.height > 50 { // vers bas
                                    if currentIndex > 0 {
                                        currentIndex -= 1
                                    }
                                }
                                
                                dragEnv = .zero
                            }
                    )
                    .onAppear {
                        currentIndex = letterVM.lastFourSlots.count - 1
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
    
#Preview {
    mailbox3View()
        .environment(NavigationViewModel())
        .environment(LetterViewModel())
    
}


