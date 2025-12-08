////
////  mailbox2View.swift
////  HappyGift
////
////  Created by alize suchon on 13/11/2025.
////
//
//import SwiftUI
//
//struct mailboxView: View {
//    
////    @State private var enveloppes = ["env_rouge", "env_rose", "env_vert", "env_rouge", "env_rose", "env_vert", "env_rouge"]
//    @State private var currentIndex: Int = 3
//    @State private var dragEnv: CGSize = .zero
//    @Environment(NavigationViewModel.self) var navVM
//    @Environment(LetterViewModel.self) var letterVM
//
//    
//    
//    var body: some View {
//        
//        ZStack{
//            Color(.beige)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 50){
//                
//                Text("Boîte aux lettres")
//                    .font(.custom("Syncopate-Bold", size: 30))
//                    .foregroundColor(.black)
//                    .padding(.top, 20)
//                    .multilineTextAlignment(.center)
//                Spacer()
//                
//                ZStack {
//                    ForEach(letterVM.enveloppes.indices, id: \.self) { index in
//                        let position = CGFloat(index - currentIndex)
//                        let size = 360 - abs(position) * 10
//
//                        if abs(position) <= 3 {
//                            // Enveloppe centrale cliquable
//                            if index == currentIndex {
//                                Button {
//                                    navVM.path.append(AppRoute.enveloppeView)
//                                } label: {
//                                    Image(letterVM.enveloppes[index])
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: size, height: size * 0.66)
//                                        .offset(y: position * 60 + dragEnv.height)
//                                        .scaleEffect(1.05)
//                                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
//                                        .zIndex(-abs(position))
//                                }
//                                .buttonStyle(.plain) // pour retirer le style par défaut
//                            } else {
//                                Image(letterVM.enveloppes[index])
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: size, height: size * 0.66)
//                                    .offset(y: position * 60)
//                                    .scaleEffect(1.0)
//                                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
//                                    .zIndex(-abs(position))
//                            }
//                        }
//                    }
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                dragEnv = value.translation
//                            }
//                            .onEnded { value in
//                                if value.translation.height < -50 {
//                                    if currentIndex < letterVM.enveloppes.count - 1 { currentIndex += 1 }
//                                } else if value.translation.height > 50 {
//                                    if currentIndex > 0 { currentIndex -= 1 }
//                                }
//                                dragEnv = .zero
//                            }
//                    )
//                }
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    mailboxView()
//        .environment(NavigationViewModel())
//        .environment(LetterViewModel())
//}
