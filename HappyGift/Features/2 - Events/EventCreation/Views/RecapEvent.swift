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
                        navigationVM.path.append(AppRoute.tirageView)
                    }label:{
                        ButtonText(text: "Lancer le tirage", width: 190)
                    }
                }
            }
        }
    }
}

#Preview {
    RecapEvent()
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}



