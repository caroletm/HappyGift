//
//  DetailEvent.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct DetailEvent: View {
    
    @Environment(EventViewModel.self) private var eventVM
    @Environment(NavigationViewModel.self) private var navigationVM
    
    var body: some View {
        
        ZStack {
            Color.beige.edgesIgnoringSafeArea(.all)
            ZStack {
                
                ZStack {
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
                            Text(eventVM.nomEvent)
                                .font(.custom( "Syncopate-Bold", size: 16))
                                .foregroundStyle(Color.white)
                            Text(eventVM.descriptionEvent)
                                .foregroundStyle(Color.white)
                                .frame(width: 260, height: 150)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .offset(x: 0, y: -210)
                    HStack {
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
                        .rotationEffect(Angle(degrees: -12))
                        .padding(.top, 20)
                        .offset(x:40)
                        
                    }
                    .offset(y: 40)
                    
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
                        
                        Image("bouleBeige")
                            .offset(x: 80, y: -40)
                        Image("bouleRouge")
                            .offset(x:-90, y: -40)
                            .rotationEffect(Angle(degrees: -15))
                        //                    Image("bouleBeige")
                        //                        .offset(x:-85, y: 35)
                        Image("bouleRouge")
                            .offset(x:30, y:80)
                            .rotationEffect(Angle(degrees: -50))
                        Image("bouleBeige")
                            .offset(x: 55, y: 80)
                        Image("bouleRouge")
                            .offset(x:-90, y:20)
                            .rotationEffect(Angle(degrees: -50))
                        
                    }
                    .offset(x: 160, y: 270)
                    .rotationEffect(Angle(degrees: 15))
                    
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
                                Text("\(eventVM.priceGift) €")
                                    .font(.custom( "Syncopate-Bold", size: 18))
                                    .foregroundStyle(Color.white)
                                    .padding(.horizontal, 10)
                            
                        }
                        
                    }
                    .rotationEffect(Angle(degrees: -15))
                    .offset(x: -90, y: 230)
                }
            }
            VStack {
                Spacer()
                Button {
//                    navigationVM.path = NavigationPath()
                }label:{
                    ButtonText(text: "Ecrire à mon pere noel", width: 270)
                }
                
            }
        }
    }
}

#Preview {
    DetailEvent()
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
