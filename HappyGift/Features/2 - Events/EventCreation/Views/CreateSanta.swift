//
//  CreateSanta.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct CreateSanta: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @Bindable var eventViewModel : EventViewModel
    @Environment(NavigationViewModel.self) private var navigationVM
    @State var showAlert: Bool = false
   
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.vert.edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Image(.littleSantaClaus)
                        
                    }
                    ScrollView {
                        VStack {
                            
                            Text("Image de l'evenement")
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(.white)
                            
                            HStack {
                                ForEach(eventViewModel.iconsEvent, id: \.self) { icon in
                                    Button {
                                        eventViewModel.iconSelected = icon
                                    }label:{
                                        IconCard(image: icon)
                                            .opacity(eventViewModel.iconSelected == icon ? 1 : 0.5)
                                            .scaleEffect(eventViewModel.iconSelected == icon ? 1.1 : 1.0)
                                            .animation(.easeInOut(duration: 0.2), value: eventViewModel.iconSelected)
                                    }
                                }
                            }.padding()
                                .padding(.bottom,10)
                            
                            Text("Nom de l'evenement")
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(.white)
                                .padding(.top, 10)
                            
                            TextField("Nom de l'évènement", text: $eventViewModel.nomEvent)
                                .padding()
                                .frame(width: 360, height: 40, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding()
                                .padding(.bottom,20)
                            
                            Text("Description de l'evenement")
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(.white)
                            TextEditor(text: $eventViewModel.descriptionEvent)
                                .padding()
                                .frame(width: 360, height: 135, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding()
                                .padding(.bottom,20)
                            
                            Text("Lieu de l'evenement")
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(.white)
                            TextField("Lieu", text: $eventViewModel.lieuEvent)
                                .padding()
                                .frame(width: 360, height: 40, alignment: .center)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding()
                                .padding(.bottom,20)
                            
                            
                            Text("Date & Heure de l'evenement")
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(.white)
                                .padding()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                DatePicker(
                                    "",
                                    selection: $eventViewModel.dateEvent,
                                    displayedComponents: [.date, .hourAndMinute]
                                )
                                .datePickerStyle(.graphical)
                                .accentColor(.rose)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                            .padding(.bottom,20)
                            
                            Button {
                                if eventVM.isValidFormEvent{
                                    navigationVM.path.append(AppRoute.recapEvent)
                                }else{
                                    showAlert = true
                                }
                            }label:{
                                ButtonText(text: "OK", width: 150)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        .alert("Validation impossible", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Vous n'avez pas rempli tous les champs!")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CreateSanta(eventViewModel: EventViewModel())
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
