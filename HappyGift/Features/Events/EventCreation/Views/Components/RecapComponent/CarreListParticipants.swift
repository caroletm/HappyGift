//
//  CarreListParticipants.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//
import SwiftUI

struct CarreListeParticipants: View {
    
    @Environment(NavigationViewModel.self) private var navigationVM
    @State private var pulse = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.rose)
                .frame(width: 260, height: 260)
                .cornerRadius(28)
            VStack (alignment: .center) {
                Text("Liste des\n participants")
                    .font(.custom( "Syncopate-Bold", size: 18))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                
                Button {
                    navigationVM.path.append(AppRoute.participantList)
                }label:{
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.2)
                            .frame(width: 75, height: 75)
                            .cornerRadius(10)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color.white)
                          
                    }
                    .offset(y: 10)
                    .shadow(
                        color: Color.white.opacity(pulse ? 1 : 0),
                        radius: pulse ? 30 : 5
                    )
                }
            }
            .offset(y: -40)
            
            Image("bouleBeige")
                .offset(x: 80, y: -40)
            Image("bouleRouge")
                .offset(x:-90, y: -40)
                .rotationEffect(Angle(degrees: -15))
            Image("bouleBeige")
                .offset(x:-85, y: 35)
            Image("bouleRouge")
                .offset(x:30, y:80)
                .rotationEffect(Angle(degrees: -50))
            Image("bouleBeige")
                .offset(x: 55, y: 80)
            Image("bouleRouge")
                .offset(x:-90, y:20)
                .rotationEffect(Angle(degrees: -50))
            
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                pulse.toggle()
            }
        }
    }
}
#Preview {
    CarreListeParticipants()
        .environment(NavigationViewModel())
}
