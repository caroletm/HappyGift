//
//  CarreVertBudgetPlus.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreVertBudgetPlus: View {
    
    @Environment(EventViewModel.self) private var eventVM
    
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
                    Button {
                        eventVM.minusBudget()
                    }label:{
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            Image(systemName: "minus")
                                .foregroundStyle(Color.black)
                        }
                    }
                    Text("\(eventVM.priceGift) €")
                        .font(.custom( "Syncopate-Bold", size: 18))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 10)
                    Button {
                        eventVM.addBudget()
                    }label:{
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            Image(systemName: "plus")
                                .foregroundStyle(Color.black)
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CarreVertBudgetPlus()
        .environment(EventViewModel())
}
