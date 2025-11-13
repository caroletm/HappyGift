//
//  Countdown.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct Countdown : View {
    @Binding var viewModel : LandingScreenViewModel
    
    var body: some View {
        VStack {
            //les élements au dessus de la neige
            HStack {
                Text("Prochain Évènement")
                    .font(.custom("Syncopate-Bold", size: 12))
                    .padding(.leading, 30)
                    .padding(.bottom)
                Spacer()
            }

            ZStack {
                HStack (spacing: 15) {
                    VStack {
                        Text("jours")
                            .font(.custom("Syncopate-Bold", size: 10))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(viewModel.formattedBackupTimeLeft.days)
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
                            .font(.custom("Syncopate-Bold", size: 10))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(viewModel.formattedBackupTimeLeft.hours)
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
                            .font(.custom("Syncopate-Bold", size: 10))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .overlay {
                                Text(viewModel.formattedBackupTimeLeft.minutes)
                                    .font(.custom("Syncopate-Bold", size: 24))
                                    .foregroundStyle(.vertDark)
                                    .contentTransition(.numericText(countsDown: true))

                            }

                    }
                }
            }
        }
        .onAppear {
            viewModel.startTimer()
            viewModel.updateTimeLeft()
        }
    }
}

#Preview {
    ZStack {
        Color.gris
        Countdown(viewModel: .constant(LandingScreenViewModel(eventVM: EventViewModel())))

    }
}


