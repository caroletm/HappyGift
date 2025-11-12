//
//  LandingScreenView.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
        ZStack {
            Color.vert
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                //les backgrounds neige + boite aux lettres + hello Name
                Text("Hello Name!")
                    .font(.custom("Syncopate-Bold", size: 30))
                    .foregroundStyle(.white)
                    .padding(.top,30)
                    .padding(25)
                
                Spacer()
                //font gris
                Image(.neigeFontDark)
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height / 2.6)
                    .overlay {
                        //font blanc en OVERLAY
                        Image(.neigeFont)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 580)
                            .offset(y: 5)
                            .overlay {
                                // boite au lettre et bonhomme de neige en OVERLAY sur le font neige blanc
                                VStack {
                                    HStack{
                                        //boite aux lettres et bonhomme de neige
                                        VStack {
                                            //boite aux lettres et son ombre
                                            Image(.boiteAuxLettres)
                                            Image(.ombreBoite)
                                                .offset(y: -10)
                                        }
                                        Image(.bonhomme)
                                            .padding(.top,30)
                                        Spacer()
                                    }.frame(width: UIScreen.main.bounds.width / 1.3)
                                    
                                    Spacer()
                                }.frame(height: UIScreen.main.bounds.height / 1.1)
                                
                                
                            }
                    }
            }
            
            VStack {
                Spacer()
                Countdown()
                    .padding(.bottom)
                
                ButtonsLandingScreen()
            }.padding(.bottom)
            
            
        }
    }
}

#Preview {
    LandingScreenView()
}
