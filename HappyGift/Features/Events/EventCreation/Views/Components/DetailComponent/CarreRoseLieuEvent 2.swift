//
//  CarreRoseLieuEvent.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import  SwiftUI

struct CarreRoseLieuEvent2: View {
    
    @Environment(EventViewModel.self) private var eventVM
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.rose)
                .frame(width: 140, height: 140)
                .cornerRadius(28)
                .rotationEffect(Angle(degrees: 21))
            Image("greenMapPoint")
                .offset(x: 25, y: -60)
            VStack (alignment: .center) {
                Text("Lieu")
                    .font(.custom( "Syncopate-Bold", size: 16))
                    .foregroundStyle(Color.white)
                Text(eventVM.lieuEvent)
                    .foregroundStyle(Color.white)
                    .padding(5)
            }.padding(.top, 20)
                .multilineTextAlignment(.center)
                .rotationEffect(Angle(degrees: 21))
        }
    }
}

#Preview {
    CarreRoseLieuEvent2()
        .environment(EventViewModel())
}
