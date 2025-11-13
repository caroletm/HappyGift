//
//  LandingScreenView.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct LandingScreenView: View {
    
    @State var viewModel = LandingScreenViewModel(targetDate: Date())
    @Environment(NavigationViewModel.self) var navVM
    
    
    var body: some View {
        
        ZStack {
            Color.vert
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                //les backgrounds neige + boite aux lettres + hello Name
                Text("Hello \(userStandard.name)!")
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
                                        Button {
                                            //TODO: vers la boite aux lettres
                                            navVM.path.append(AppRoute.enveloppeView)
                                            
                                        } label: {
                                            VStack {
                                                //boite aux lettres et son ombre
                                                withAnimation(.easeInOut(duration: 2)) {
                                                    Image(viewModel.mailboxIsEmpty ? .boiteAuxLettresVide : .boiteAuxLettres)
                                                }
                                                Image(.ombreBoite)
                                                    .offset(y: -10)
                                                
                                            }
                                        }
                                        
                                        
                                        VStack {
                                            if !viewModel.mailboxIsEmpty {
                                                
                                                Button {
                                                    //TODO: vers la boite aux lettres
                                                    navVM.path.append(AppRoute.enveloppeView)
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
            
            SnowfallView2()
        }
        
        
    }
}

struct SnowfallView2: View {
    @StateObject private var viewModel: SnowfallVM
    
    var size: CGFloat
    
    init(size: CGFloat = 450, snowCount: Int = 80) {
        _viewModel = StateObject(wrappedValue: SnowfallVM(numberOfSnowflakes: snowCount, size: size))
        self.size = size
    }
    
    var body: some View {
        Canvas { context, _ in
            for flake in viewModel.snowflakes {
                let position = CGPoint(x: flake.x, y: flake.y)
                let radius = flake.size
                context.fill(
                    Path(ellipseIn: CGRect(
                        x: position.x - radius,
                        y: position.y - radius,
                        width: radius * 2,
                        height: radius * 2
                    )),
                    with: .color(.gris)
                )
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
}

#Preview {
    LandingScreenView()
        .environment(NavigationViewModel())
}

#Preview {
    ZStack {
        Color.vert
        SnowfallView2()
    }
    
}
