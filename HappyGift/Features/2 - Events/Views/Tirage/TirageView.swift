//
//  TirageView.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import SwiftUI

struct TirageView: View {
    
    @Environment(EventViewModel.self) private var eventViewModel
    @Environment(NavigationViewModel.self) private var navigationViewModel
    @Environment(SnowfallVM.self) private var snowfallViewModel
    @Environment(UserViewModel.self) var userVM
    
    @State var showModal = false
    var showBackButton: Bool
    
    var shouldShowModal: Bool {
        eventViewModel.hasJustCreatedEvent
        && !event.tirages.isEmpty
    }
    
    var event : EventDTO
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("vert").edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center){
                    if (eventViewModel.selectedPerson != nil) {
                        Text("Tu dois offrir un cadeau à")
                            .font(.custom("Syncopate-Bold", size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("rose"))
                    }else {
                        Text("Secoue pour voir qui tu as tiré")
                            .font(.custom("Syncopate-Bold", size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("rose"))
                    }
                    
                    ZStack{
                        //MARK: - Globe
                        Image("SnowGlobe")
                            .resizable()
                            .scaledToFit()
                        
                        //MARK: - Name
                        
                        if let name =  eventViewModel.selectedPerson {
                            Text(name)
                                .font(.custom("Syncopate-Bold", size: 18))
                                .foregroundColor(Color("rose"))
                                .frame(maxWidth: 110)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .offset(y: 152)
                                .transition(.opacity)
                                .animation(.easeInOut, value: eventViewModel.selectedPerson)
                        }
                    }
                    //MARK: - Button
                    Button{
                        if shouldShowModal {
                            showModal = true
                            eventViewModel.hasJustCreatedEvent = false
                        } else {
                            eventViewModel.resetTirage()
                            navigationViewModel.path = NavigationPath()
                        }
                    } label: {
                        Text("OK")
                            .font(.system(size: 17, weight : .bold))
                            .foregroundStyle(.white)
                            .frame(width: 150, height: 63)
                            .background(.black.opacity(0.85))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    
                }.padding(10)
                
                // MARK: - Gestion de la neige
                if (eventViewModel.showSnow) {
                    SnowfallView(size: 300)
                        .transition(.opacity)
                        .offset(y: -40)
                        .animation(.easeInOut(duration: 0.5), value: eventViewModel.showSnow)
                }
                
                // MARK: - Shake uniquement si pas encore tiré
                
                if !event.tirages.isEmpty {
                    ShakeDetector {
                            Task {
                                navigationViewModel.isLoading = true
                                defer {navigationViewModel.isLoading = false}
                                guard let eventId = event.id else { return }
                                await eventViewModel.findDrawForCurrentUser(eventId: eventId)
                                withAnimation {
                                eventViewModel.showSnow = true
                            }
                        }
                        print("shake ok")
                    }
                    .allowsHitTesting(false)
                }
            }
        }
        .sheet(isPresented: $showModal){
            SucessEventModal(showModal: $showModal)
        }
//        .onAppear {
//            if !event.tirages.isEmpty {
//                Task {
//                    navigationViewModel.isLoading = true
//                    defer {navigationViewModel.isLoading = false}
//                    guard let eventId = event.id else { return }
//                    await eventViewModel.findDrawForCurrentUser(eventId: eventId)
//                }
//            }
//        }
        .navigationBarBackButtonHidden(!showBackButton)
    }
}

#Preview {
    TirageView(showBackButton: true, event: santa1)
        .environment(NavigationViewModel())
        .environment(SnowfallVM(
            numberOfSnowflakes: 100,
            area: .circle,
            width: 300,
            height: 300
        ))
        .environment(EventViewModel())
        .environment(UserViewModel())
        
}
