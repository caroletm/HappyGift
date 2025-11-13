//
//  MailBoxView.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

public struct EnveloppeView: View {
    
    @State var viewModel: LetterViewModel
    @State var isLetterOpen = false
    @State var isFlapOpen = false
    
//    @Binding var landingVM : LandingScreenViewModel
    
    @Environment(LandingScreenViewModel.self) private var landingVM

    
    public var body: some View {
        
        ZStack{
            Color(.rose)
                .ignoresSafeArea()
            
            VStack(spacing: 50){
                VStack{
                    Text("Boîte aux lettres")
                        .font(.custom("Syncopate-Bold", size: 30))
                        .foregroundColor(.beige)
                        .padding(.top, 25)
                        .multilineTextAlignment(.center)
                        
                }
                Spacer()
                
                ZStack(alignment: .bottom){
                    // FOND ENVELOPPE
                    Rectangle()
                        .frame(width: 352, height: 250)
                        .foregroundColor(.rougeClair)
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
                        .zIndex(0)
                    
                    // LETTRE
                    LetterView(
                        userMessage: viewModel.userMessage,
                        signature: viewModel.signature,
                        height: isLetterOpen ? 350 : 240
                    )
                    .frame(width: 330)
                    .offset(y: isLetterOpen ? -120 : 0)
                    .zIndex(2)
                    .animation(.easeInOut(duration: 0.7), value: isLetterOpen)
                    
                    // RABAT
                    if !isFlapOpen {
                        Image("triangleB")
                            .offset(y: -115)
                            .shadow(radius: 2)
                            .zIndex(2)
                            .opacity(isFlapOpen ? 0 : 1)
                            .animation(.easeInOut(duration: 0.5), value: isFlapOpen)
                    } else {
                        Image("triangleH")
                            .offset(y: -247)
                            .zIndex(1)
                            .animation(.easeInOut(duration: 0.5), value: isFlapOpen)
                    }
                    
                    // DEVANT ENVELOPPE
                    Image("enveloppe")
                        .zIndex(3)
                        .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: -1)
                }
                .offset(y: -40)
                Button {
                    if !isFlapOpen {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isFlapOpen.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isLetterOpen.toggle()
                            }
                        }
                    } else {
                        withAnimation(Animation.easeInOut(duration: 0.3).delay(0.3)) {
                            isLetterOpen.toggle()
                            landingVM.mailboxIsEmpty.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isFlapOpen.toggle()
                            }
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black)
                            .frame(width: 250, height: 60)
                        Text(isFlapOpen ? "Fermer" : "Ouvrir mon courrier")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.beige)
                    }
                }
            }
        }
    }
}

#Preview {
    EnveloppeView(viewModel: LetterViewModel())
        .environment(LandingScreenViewModel(eventVM: EventViewModel()))
}
