//
//  CarreVertBudget.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreVertBudget: View {
    
    @Environment(EventViewModel.self) private var eventVM
    
    var event : EventDTO

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.vert)
                .frame(width: 200, height: 210)
                .cornerRadius(25)
            VStack {
                Text("Budget")
                    .font(.custom( "Syncopate-Bold", size: 18))
                    .foregroundStyle(Color.white)
                Image("giftBox")
                    .resizable()
                    .scaledToFit( )
                    .frame(width: 75, height: 75)
                    .rotationEffect(Angle(degrees: 15))
                    .padding(5)
                HStack {
                }
                Text("\(event.prixCadeau) €")
                    .font(.custom( "Syncopate-Bold", size: 18))
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 10)
                
            }
            
        }

    }
}

