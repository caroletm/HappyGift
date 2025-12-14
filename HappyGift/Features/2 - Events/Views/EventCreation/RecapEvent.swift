//
//  RecapEvent.swift
//  HappyGift
//
//  Created by caroletm on 12/11/2025.
//

import SwiftUI

struct RecapEvent: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @Environment(NavigationViewModel.self) private var navigationVM
    @Environment(UserViewModel.self) private var userVM
    @State var showAlert: Bool = false
    @State var showAlertParticipant: Bool = false
        
    var body: some View {
        
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
            ZStack {
                
                ZStack {
                    ZStack {
                        CarreNomDescriptionEvent()
                        .offset(x: 0, y: -220)
                    HStack {
                        CarreRoseLieuEvent()
                        CarreRougeDateEvent()
                            .rotationEffect(Angle(degrees: -12))
                            .padding(.top, 20)
                            .offset(x:40)
                    }
                    
                        CarreListeParticipants()
                            .offset(x: 160, y: 220)
                            .rotationEffect(Angle(degrees: 15))
                    
                        CarreVertBudgetPlus()
                            .rotationEffect(Angle(degrees: -15))
                            .offset(x: -110, y:  190)
                }
            }
                VStack {
                    Spacer()
                    
                    Button {
                        Task {
                            //  Vérifs AVANT le loader
                            if !eventVM.participants.contains(where: {
                                $0.email.lowercased() == userVM.email.lowercased()
                            }) {
                                showAlertParticipant = true
                                return
                            }

                            if !eventVM.isValidFormEvent2 {
                                showAlert = true
                                return
                            }

                            //  LOADER
                            navigationVM.isLoading = true
//                            navigationVM.start()
                            defer {
//                                navigationVM.stop()
                                navigationVM.isLoading = false
                            }

                            // Réseau
                            await eventVM.createEvent()
                            eventVM.hasJustCreatedEvent = true

                            //  Navigation
                            if let event = eventVM.currentEvent {
                                navigationVM.path.append(
                                    AppRoute.tirageView(event: event, showbackButton: false)
                                )
                            }
                        }
                    } label: {
                        ButtonText(text: "Lancer le tirage", width: 190)
                    }
                    .disabled(navigationVM.isLoading)
                }
            }
        }
        .alert("Tirage impossible", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Vous n'avez pas défini de budget ou ajouté de participants")
        }
        .alert("Tirage impossible", isPresented: $showAlertParticipant) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Ajouter votre mail dans la liste des participants")
        }
    }
}

#Preview {
    RecapEvent()
        .environment(EventViewModel())
        .environment(NavigationViewModel())
        .environment(UserViewModel())
}



