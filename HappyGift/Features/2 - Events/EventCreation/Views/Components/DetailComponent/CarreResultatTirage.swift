//
//  CarreListParticipants.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreResultatTirage: View {
    
    @Environment(NavigationViewModel.self) private var navigationVM
    @Environment(EventViewModel.self) private var eventVM
    
    
   var event: EventDTO
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.rose)
                .frame(width: 260, height: 260)
                .cornerRadius(28)
            VStack (alignment: .center) {
                Text("Résultat\n du tirage")
                    .font(.custom( "Syncopate-Bold", size: 18))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                
                Button {
                    eventVM.resetTirage()           // ⬅️ super important
                    eventVM.currentEvent = event
                    navigationVM.path.append(AppRoute.tirageView(event: event))
                                    
                    
                }label:{
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.4)
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                        
                        Text("Voir")
                            .font(.custom( "Syncopate-Bold", size: 14))
                            .foregroundStyle(Color.white)
                    }
                    .offset(y: 10)
                }
                
            }
            .offset(y: -40)
            
            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x: 80, y: -40)
            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x:-90, y: -40)
                .rotationEffect(Angle(degrees: -15))
            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x:-85, y: 35)

            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x:30, y:80)
                .rotationEffect(Angle(degrees: -50))
            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x: 55, y: 80)
            Image("SnowGlobe")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .offset(x:-90, y:20)
                .rotationEffect(Angle(degrees: -50))
            
        }
    }
}

#Preview {
    CarreResultatTirage(event: santa1)
        .environment(NavigationViewModel())
        .environment(EventViewModel())
}
