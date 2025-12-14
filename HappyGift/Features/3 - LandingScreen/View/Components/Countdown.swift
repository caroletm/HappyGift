//
//  Countdown.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct Countdown : View {
    @Environment(LandingScreenViewModel.self)var landingVM

    var body: some View {
        VStack {
            //les élements au dessus de la neige
            HStack {
                Text("Prochain évènement")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.leading, 30)
                    .padding(.bottom)
                Spacer()
            }

            ZStack {
                HStack (spacing: 10) {
                    VStack {
                        Text("jours")
                            .font(.custom("Syncopate-Bold", size: 9))
                            .padding(.bottom, 5)
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(landingVM.formattedBackupTimeLeft.days)
                                    .font(.custom("Syncopate-Bold", size: 24))
                                    .foregroundStyle(.vertDark)
                                    .contentTransition(.numericText(countsDown: true))
                            }
                    }

                    
                    VStack {
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(.grisDark)
                        
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(.grisDark)
                    }
                    VStack {
                        Text("heures")
                            .font(.custom("Syncopate-Bold", size: 9))
                            .padding(.bottom, 5)
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(landingVM.formattedBackupTimeLeft.hours)
                                    .font(.custom("Syncopate-Bold", size: 24))
                                    .foregroundStyle(.vertDark)
                                    .contentTransition(.numericText(countsDown: true))

                            }

                    }


                    
                    VStack {
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(.grisDark)

                        
                        Circle()
                            .frame(width: 10)
                            .foregroundStyle(.grisDark)
                    }

                    VStack {
                        Text("minutes")
                            .font(.custom("Syncopate-Bold", size: 9))
                            .padding(.bottom, 5)
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(landingVM.formattedBackupTimeLeft.minutes)
                                    .font(.custom("Syncopate-Bold", size: 24))
                                    .foregroundStyle(.vertDark)
                                    .contentTransition(.numericText(countsDown: true))

                            }

                    }
                    
                    
//                    VStack {
//                        Circle()
//                            .frame(width: 10)
//                            .foregroundStyle(.grisDark)
//
//                        
//                        Circle()
//                            .frame(width: 10)
//                            .foregroundStyle(.grisDark)
//                    }
                    
//                    VStack {
//                        Text("secondes")
//                            .font(.custom("Syncopate-Bold", size: 9))
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 60, height: 60)
//                            .foregroundStyle(.white)
//                            .overlay {
//                                Text(landingVM.formattedBackupTimeLeft.seconds)
//                                    .font(.custom("Syncopate-Bold", size: 24))
//                                    .foregroundStyle(.vertDark)
//                                    .contentTransition(.numericText(countsDown: true))
//
//                            }
//
//                    }
                }
            }
        }
        .onAppear {
            landingVM.startTimer()
            landingVM.updateTimeLeft()
        }
    }
}

#Preview {
    ZStack {
        Color.gris
        Countdown()
            .environment(LandingScreenViewModel(eventVM: EventViewModel()))
    }
}


