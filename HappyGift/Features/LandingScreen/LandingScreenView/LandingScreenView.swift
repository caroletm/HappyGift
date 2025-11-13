//
//  LandingScreenView.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI
import DotLottie

struct LandingScreenView: View {
    @State var viewModel = LandingScreenViewModel(targetDate: Date())
    var body: some View {
        NavigationStack{
            ZStack {
                Color.vert
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    //les backgrounds neige + boite aux lettres + hello Name
                    Text("Hello Marie!")
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
                                            NavigationLink {
                                                //TODO: vers la boite aux lettres
                                            } label: {
                                                VStack {
                                                    //boite aux lettres et son ombre
                                                    withAnimation(.smooth) {
                                                        Image(viewModel.mailboxIsEmpty ? .boiteAuxLettresVide : .boiteAuxLettres)
                                                    }
                                                    Image(.ombreBoite)
                                                        .offset(y: -10)
                                                    
                                                }
                                            }
                                            
                                            
                                            VStack {
                                                if !viewModel.mailboxIsEmpty {
                                                    
                                                    NavigationLink {
                                                        //TODO: vers la boite aux lettres
                                                    } label: {
                                                        VStack {
                                                            Image(.bulleLettre)
                                                                .padding(.leading)
                                                            Image(.bonhomme)
                                                                .padding(.bottom, 30)
                                                        }
                                                        
                                                    }
                                                }else {
                                                    Image(.bonhomme)
                                                        .padding(.top, 17)
                                                        .padding(.leading, 11)
                                                }
                                                
                                            }
                                            Spacer()
                                        }.frame(width: UIScreen.main.bounds.width / 1.3)
                                        
                                        Spacer()
                                    }.frame(height: UIScreen.main.bounds.height / (viewModel.mailboxIsEmpty ? 1.16 : 1.1))
                                    
                                    
                                }
                        }
                }
                
                VStack {
                    Spacer()
                    Countdown(viewModel: $viewModel)
                        .padding(.bottom)
                    
                    ButtonsLandingScreen()
                }.padding(.bottom)
            }
        }
        
    }
}

struct AnimationView: View {
    var body: some View {
        ZStack {
            Color.red
            DotLottieAnimation(fileName: "cool_animation", config: AnimationConfig(autoplay: true, loop: true)).view()
        }
        
    }
}

#Preview {
    LandingScreenView()
}

#Preview {
    AnimationView()
}
