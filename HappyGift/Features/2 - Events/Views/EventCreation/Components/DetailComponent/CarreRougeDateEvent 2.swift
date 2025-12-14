//
//  CarreRougeDateEvent.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI


struct CarreRougeDateEvent2: View {
    
    @Environment(EventViewModel.self) private var eventVM
    
    var event: EventDTO

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
                Text("Date et heure")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.white)
                Text(event.date.formattedStringWithTime())
                    .foregroundStyle(Color.white)
                    .padding()
                    .font(.custom( "SFPro-Bold", size: 20))
            }
            .offset(y: 15)
        }
    }
}

#Preview {
    CarreRougeDateEvent2(event: santa1)
        .environment(EventViewModel())
}
