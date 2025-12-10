//
//  letterView.swift
//  HappyGift
//
//  Created by alize suchon on 12/11/2025.
//

import SwiftUI

public struct WriteLetterView: View {
    
    @Environment(LetterViewModel.self) var letterVM
    @Environment(NavigationViewModel.self) var navigationVM
    @State private var showModal = false

    
    public var body: some View {
        
        @Bindable var letterVM = letterVM
                
        ZStack {
            Color(.rose)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Ma lettre")
                    .font(.custom("Syncopate-Bold", size: 30))
                    .padding(.top, 20)
                    .foregroundColor(.beige)
                
                // fond papier à lettre
                ZStack(alignment: .topLeading) {
                    ZStack{
                        Image("letter")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .shadow( color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(edges: .horizontal)
                        Rectangle()
                            .foregroundColor(.beige)
                            .frame(width: 305, height: 510)
                            .shadow( color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Cher père Noël,")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.leading, 0.8)
                        
                        // message
                        ZStack(alignment: .topLeading) {
                            if letterVM.userMessage.isEmpty {
                                Text("Écris ton message ici ...")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                    .padding(.top, 8)
                                    .padding(.leading, 5)
                            }
                                TextEditor(text: $letterVM.userMessage)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .scrollContentBackground(.hidden)
                                    .background(Color.clear)
                                    .lineSpacing(5)
                                    .frame(height: 350)
                                
                        }
                        // Signature
                        HStack{
                            Spacer()
                            ZStack(alignment: .trailing) {
                                if letterVM.signature.isEmpty {
                                    Text("Prénom")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                        .padding(.bottom, 5)
                                        .padding(.trailing, 2.5)
                                }
                                TextEditor(text: $letterVM.signature)
                                    .font(.system(size: 18, weight: .regular))
                                    .foregroundColor(.black)
                                    .scrollContentBackground(.hidden)
                                    .background(Color.clear)
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 160, height: 45)
                            }
                        }
                    }
                    .padding(.horizontal, 65)
                    .padding(.vertical, 100)
                }
                .frame(maxWidth: 600, maxHeight: 800)
                .padding(.horizontal)
                
                Button {
                    letterVM.sendLetter()
                    print(letterVM.mailboxData)
                    showModal = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.black)
                            .frame(width: 250, height: 60)
                        Text("Envoyer ma lettre")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.beige)
                        
                    }
                }
                //Modale
                .sheet(isPresented: $showModal){
                    SucessLetterModal(showModal: $showModal)
                }
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}


#Preview {
    WriteLetterView()
        .environment(LetterViewModel(userVM: UserViewModel()))
        .environment(NavigationViewModel())
}


// Extension pour cacher le clavier sur iOS/iPadOS
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

