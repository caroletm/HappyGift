//
//  CreateSanta.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct CreateSanta: View {
    
    @State var nomEvent: String = ""
    @State var descriptionEvent: String = ""
    @State var iconEvent: String = ""
    @State var dateEvent: Date = Date()
    @State var lieuEvent: String = ""
    
    var body: some View {
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image(.littleSantaClaus)
//                    Text("Nouveau Secret Santa")
//                        .font(.custom("Syncopate-Bold", size: 13))
//                        .foregroundStyle(.rouge)
                        
                }
                ScrollView {
                    VStack {
                        
                        Text("Nom de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                            .padding(.top, 10)
                        
                        TextField("Nom de l'évènement", text: $nomEvent)
                            .frame(width: 340, height: 40, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                        Text("Icone de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { icon in
                                IconCard(image:"carChristmas")
                            }
                        }.padding()
                        
                        
                        Text("Description de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        TextEditor(text: $descriptionEvent)
                            .frame(width: 340, height: 135, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                
                        
                        Text("Lieu de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        TextField("Lieu", text: $lieuEvent)
                            .frame(width: 340, height: 40, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                        Text("Date de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                            .padding()
                        
                        HStack {
                           
                            Button {
                                //
                            }label: {
                                Text("Jour")
                            }
                            Button {
                                //
                            }label: {
                                Text("Mois")
                            }
                            Button {
                                //
                            }label: {
                                Text("Heure")
                            }
                            Button {
                                //
                            }label: {
                                Text("Minute")
                            }

        
                        }
                        
                        ButtonText(text: "OK", width: 150)
                            .padding()
                        
                    }
                }
            }
        }
    }
}

#Preview {
    CreateSanta()
}
