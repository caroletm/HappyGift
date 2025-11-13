//
//  ButtonsLandingScreen.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct ButtonsLandingScreen: View {
    @Environment(NavigationViewModel.self) var navVM

    var body: some View {
            VStack {
                Button {
                    //TODO: vers créer un évènement
                    navVM.path.append(AppRoute.createEvent)
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 100)
                        .foregroundStyle(.vert)
                        .overlay {
                            Rectangle()
                                .frame(height: 25)
                                .foregroundStyle(.rouge)
                                .padding(.bottom, 36)
                        }
                        .overlay {
                            Rectangle()
                                .frame(width: 30)
                                .foregroundStyle(.rouge)
                                .border(.rougeDark, width: 1.5)
                                .padding(.trailing, 220)
                        }
                        .overlay {
                            Text("Créer un évènement")
                                .font(.custom("Syncopate-Bold", size: 12))
                                .foregroundStyle(.beige)
                                .padding(.top, 55)
                                .padding(.leading, 120)
                        }
                }
                .buttonStyle(.plain)
                .padding(.bottom)
                
                
                Button {
                    //TODO: vers liste d'évènements
//                    navVM.path.append(AppRoute.)
                    
                } label: {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 100)
                        .foregroundStyle(.rose)
                        .overlay {
                            VStack {
                                Image(.sucreOrge)
                                    .padding(.bottom)
                                Text("Voir mes évènements")
                                    .font(.custom("Syncopate-Bold", size: 12))
                                    .foregroundStyle(.beige)
                                    .padding(.bottom)
                            }
                            
                        }
                    
                }.buttonStyle(.plain)
                
                
                
            }.padding(.horizontal, 25)
        
       
        
        
        
    }
}

#Preview {
    ButtonsLandingScreen()
        .environment(NavigationViewModel())
}
