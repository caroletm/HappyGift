//
//  Untitled.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreNomDescriptionEvent: View {
    
    @Environment(EventViewModel.self) private var eventVM

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.vert)
                .frame(width: 330, height: 300)
                .cornerRadius(20)
                .padding()
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 90, height: 90)
                Image(eventVM.iconSelected ?? "carChristmas")
                    .resizable()
                    .scaledToFit( )
                    .frame(width: 59, height: 44)
            }
            .offset(x: 0, y: -150)
            VStack(alignment: .center) {
                Text(eventVM.nomEvent)
                    .font(.custom( "Syncopate-Bold", size: 18))
                    .foregroundStyle(Color.white)
                    .frame(width: 310)
                    .multilineTextAlignment(.center)
                ScrollView {
                    Text(eventVM.descriptionEvent)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 10)
                    .frame(width: 260, height: 150)
            }
        }
    }
}

#Preview {
    CarreNomDescriptionEvent()
        .environment(EventViewModel())
}
