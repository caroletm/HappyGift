//
//  CarreRougeDateEvent.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI


struct CarreRougeDateEvent: View {
    
    @Environment(EventViewModel.self) private var eventVM

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.rouge)
                .frame(width: 198, height: 183)
                .cornerRadius(28)
            Image("calendarNoel")
                .rotationEffect(Angle(degrees: 12))
                .offset(y: -90)
            VStack {
                Text("Date du secret")
                    .font(.custom( "Syncopate-Bold", size: 14))
                    .foregroundStyle(Color.white)
                Text(eventVM.dateEvent.formattedStringWithTime())
                    .foregroundStyle(Color.white)
                    .padding()
                    .font(.custom( "SFPro-Bold", size: 20))
            }
            .offset(y: 15)
        }
    }
}

#Preview {
    CarreRougeDateEvent()
        .environment(EventViewModel())
}
