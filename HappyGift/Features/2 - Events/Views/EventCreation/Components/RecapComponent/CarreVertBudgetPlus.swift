//
//  CarreVertBudgetPlus.swift
//  HappyGift
//
//  Created by caroletm on 16/11/2025.
//

import SwiftUI

struct CarreVertBudgetPlus: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @State private var pulse = false
    
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
                    .shadow(
                        color: Color.white.opacity(pulse ? 1 : 0),
                        radius: pulse ? 30 : 5
                    )
                HStack {
                    Button {
                        if eventVM.priceGift > 0 {
                            eventVM.minusBudget()
                        }
                    }label:{
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            Image(systemName: "minus")
                                .foregroundStyle(Color.black)
                        }
                    }
                    .simultaneousGesture(
                        LongPressGesture(minimumDuration: 0.5)
                            .onEnded { _ in
                                eventVM.startDecrementing()
                            }
                    )
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { _ in
                                eventVM.stopDecrementing()
                            }
                    )
                    
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
                    .simultaneousGesture(
                                          LongPressGesture(minimumDuration: 0.5)
                                              .onEnded { _ in
                                                  eventVM.startIncrementing()
                                              }
                                      )
                                      .simultaneousGesture(
                                          DragGesture(minimumDistance: 0)
                                              .onEnded { _ in
                                                  eventVM.stopIncrementing()
                                              }
                                      )
                    
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                pulse.toggle()
            }
        }
        .onDisappear {
              eventVM.stopAllTimers()
          }
    }
}

#Preview {
    CarreVertBudgetPlus()
        .environment(EventViewModel())
}
