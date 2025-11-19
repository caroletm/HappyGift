//
//  DetailEvent.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct DetailEvent: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @Environment(NavigationViewModel.self) private var navigationVM
    
    var event: Event
    
    var body: some View {
        
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
            ZStack {
                
                ZStack {
                    CarreNomDescriptionEvent2(event: event)
                        .offset(x: 0, y: -220)

                    HStack {
                        CarreRoseLieuEvent2()
                        CarreRougeDateEvent2()
                            .rotationEffect(Angle(degrees: -12))
                            .padding(.top, 20)
                            .offset(x:40)
                    }
                    CarreResultatTirage()
                        .offset(x: 160, y: 220)
                        .rotationEffect(Angle(degrees: 15))
                    
                    CarreVertBudget()
                        .rotationEffect(Angle(degrees: -15))
                        .offset(x: -110, y:  190)
                }
            }
            VStack {
                Spacer()
                Button {
                    navigationVM.path.append(AppRoute.writeLetter)
                }label:{
                    ButtonText(text: "Ecrire à mon pere noel", width: 270)
                }
                
            }
        }
    }
}

#Preview {
    DetailEvent(event: santa1)
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}






