//
//  TirageView.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import SwiftUI

struct TirageView: View {

    @Environment(TirageViewModel.self) private var tirageViewModel
    @Environment(ParticipantViewModel.self) private var participantViewModel
    @Environment(NavigationViewModel.self) private var navigationViewModel
    @Environment(SnowfallVM.self) private var snowfallViewModel
    
    
    var body: some View {
        ZStack {
            Color("vert").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                Text("Shake your phone to see who you got!")
                    .font(.custom("Syncopate-Bold", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("rose"))
                
                ZStack{
                    //MARK: - Globe
                    Image("SnowGlobe")
                        .resizable()
                        .scaledToFit()
                    
                    //MARK: - Name
                    if let name =  tirageViewModel.selectedName {
                        Text(tirageViewModel.selectedName ?? "OK")
                            .font(.custom("Syncopate-Bold", size: 18))
                            .foregroundColor(Color("rose"))
                            .frame(maxWidth: 110)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .offset(y: 152)
                            .transition(.opacity)
                            .animation(.easeInOut, value: tirageViewModel.selectedName)
                    }
                }
                //MARK: - Button
                    Button{
                    
                    navigationViewModel.path = NavigationPath()
                    
                } label: {
                    Text("OK")
                        .font(.custom("Syncopate-Bold", size: 17))
                        .foregroundStyle(.white)
                        .frame(width: 278, height: 63)
                        .background(.black.opacity(0.85))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
            }.padding(10)
            
            if tirageViewModel.showSnow {
                SnowfallView()
                    .transition(.opacity)
                    .environment(SnowfallVM(
                           numberOfSnowflakes: 100,
                           area: .circle,
                           width: 300,
                           height: 300
                       ))
                
            }
            
            ShakeDetector {
                tirageViewModel.handleShake()
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    TirageView()
        .environment(TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole"))
        .environment(ParticipantViewModel())
        .environment(NavigationViewModel())
        .environment(SnowfallVM(
               numberOfSnowflakes: 100,
               area: .circle,
               width: 300,
               height: 300
           ))
}
