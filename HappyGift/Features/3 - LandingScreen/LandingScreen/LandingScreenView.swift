//
//  LandingScreenView.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct LandingScreenView: View {
    
    @Environment(LandingScreenViewModel.self)var landingVM
    @Environment(NavigationViewModel.self) var navVM
    @Environment(EventViewModel.self)var eventVM
    @Environment(SnowfallVM.self)var snowfallVM
    @Environment(LetterViewModel.self)var letterVM
    @Environment(AuthViewModel.self) var authVM
    @Environment(UserViewModel.self) var userVM
    
    @State var showLogoutModal: Bool = false
    
    var body: some View {
        
        @Bindable var landingVM = landingVM
        
        NavigationView {
            ZStack {
                Color.vert
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    //les backgrounds neige + boite aux lettres + hello Name
                    Text("Hello \(userVM.name)!")
                        .font(.custom("Syncopate-Bold", size: 25))
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
                                                navVM.path.append(AppRoute.mailbox)
                                                
                                            } label: {
                                                VStack {
                                                    //boite aux lettres et son ombre
                                                    withAnimation(.easeInOut(duration: 2)) {
                                                        Image(letterVM.mailboxData.isEmpty ? .boiteAuxLettresVide : .boiteAuxLettres)
                                                    }
                                                    Image(.ombreBoite)
                                                        .offset(y: -10)
                                                    
                                                }
                                            }
                                            
                                            
                                            VStack {
                                                if !letterVM.mailboxData.isEmpty && letterVM.lastLetterIsRead == false {
                                                    
                                                    Button {
                                                        //TODO: vers la boite aux lettres
                                                        navVM.path.append(AppRoute.enveloppeView(letter: letterVM.mailboxData.last!))
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
                                        
                                        
                                        
                                    }.frame(height: UIScreen.main.bounds.height / (letterVM.mailboxData.isEmpty ? 1.16 : 1.1))
                                    
                                }
                        }
                    
                }
                
                VStack {
                    Spacer()
                    Countdown()
                        .padding(.bottom)
                        .onAppear {
                            landingVM.startTimer()
                        }
                    
                    ButtonsLandingScreen()
                }.padding(.bottom)
                
                SnowfallView2()
                Button {
                    showLogoutModal = true
                }label:{
                    Image(.maisonsRose)
                        .resizable()
                        .scaledToFit( )
                        .frame(width: 110, height: 310)
                        .offset(x: 130, y: -70)
                }
            }
        }
        .sheet(isPresented: $showLogoutModal) {
            LogoutModal(showLogoutModal: $showLogoutModal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SnowfallView2: View {
    @Environment(SnowfallVM.self)var snowfallVM
    
    var size: CGFloat
    
    init(size: CGFloat = 200, snowCount: Int = 80) {
        self.size = size
    }
    
    var body: some View {
        Canvas { context, _ in
            for flake in snowfallVM.snowflakes {
                let rect = CGRect(
                    x: flake.x - flake.size,
                    y: flake.y - flake.size,
                    width: flake.size * 2,
                    height: flake.size * 2
                )
                
                context.fill(
                    Path(ellipseIn: rect),
                    with: .color(.gris)
                )
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }
}

#Preview {
    let eventVM = EventViewModel()
    let userVM = UserViewModel()
    LandingScreenView()
        .environment(LetterViewModel(userVM: userVM))
        .environment(LandingScreenViewModel(eventVM: eventVM))
        .environment(NavigationViewModel())
        .environment(eventVM)
        .environment(AuthViewModel(userVM: userVM))
        .environment(SnowfallVM(
            numberOfSnowflakes: 120,
            area: .rect,
            width: UIScreen.main.bounds.width,
            height: 400
        ))
        .environment(userVM)
    
}

