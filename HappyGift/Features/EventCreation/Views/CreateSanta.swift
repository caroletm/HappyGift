//
//  CreateSanta.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct CreateSanta: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @Bindable var eventViewModel = EventViewModel()
    @Environment(NavigationViewModel.self) private var navigationVM

   
    var body: some View {
        
        
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Image(.littleSantaClaus)
                        
                }
                ScrollView {
                    VStack {
                        
                        Text("Nom de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                            .padding(.top, 10)
                        
                        TextField("Nom de l'évènement", text: $eventViewModel.nomEvent)
                            .frame(width: 360, height: 40, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .padding(.bottom,20)
                        
                        Text("Description de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        TextEditor(text: $eventViewModel.descriptionEvent)
                            .frame(width: 360, height: 135, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .padding(.bottom,20)

                        
                        Text("Image de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        
                        HStack {
                            ForEach(eventViewModel.iconsEvent, id: \.self) { icon in
                                IconCard(image: icon)
                            }
                        }.padding()
                            .padding(.bottom,20)
                        
                        Text("Lieu de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                        TextField("Lieu", text: $eventViewModel.lieuEvent)
                            .frame(width: 360, height: 40, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .padding(.bottom,20)

                        
                        Text("Date & Heure de l'evenement")
                            .font(.custom("Syncopate-Bold", size: 15))
                            .foregroundStyle(.rougeDark)
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
    
                            
                            DatePicker(
                                "",
                                selection: $eventViewModel.dateEvent,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .datePickerStyle(.graphical)
                            .accentColor(.vertDark)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .padding(.bottom,20)
                        
                        Button {
                            navigationVM.path.append(AppRoute.recapEvent)
                        }label:{
                            ButtonText(text: "OK", width: 150)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateSanta(eventViewModel: EventViewModel())
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
