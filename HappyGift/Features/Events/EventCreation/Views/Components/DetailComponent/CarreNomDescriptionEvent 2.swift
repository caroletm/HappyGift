//
//  Untitled.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreNomDescriptionEvent2: View {
    
    @Environment(EventViewModel.self) private var eventVM
    
    var event: Event

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
                Image("carChristmas")
                    .resizable()
                    .scaledToFit( )
                    .frame(width: 59, height: 44)
            }
            .offset(x: 0, y: -150)
            VStack(alignment: .center) {
                Text(event.nomEvent)
                    .font(.custom("The Santa", size: 28))
                    .foregroundStyle(Color.white)
                Text(event.descriptionEvent)
                    .foregroundStyle(Color.white)
                    .frame(width: 260, height: 150)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    CarreNomDescriptionEvent2(event: santa1)
        .environment(EventViewModel())
}
