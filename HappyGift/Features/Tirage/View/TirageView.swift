//
//  TirageView.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import SwiftUI

struct TirageView: View {
    @State var viewModel:TirageViewModel
    
    var body: some View {
        ZStack {
            Color("vert").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                Text("Shake your phone to see who you got!")
                    .font(.custom("Syncopate-Bold", size: 32))
                    .foregroundColor(Color("rose"))
                
                ZStack{
                    //MARK: - Globe
                    Image("SnowGlobe")
                        .resizable()
                        .scaledToFit()
                    
                    //MARK: - Name
                    if let name = viewModel.selectedName {
                        Text(name)
                            .font(.custom("Syncopate-Bold", size: 18))
                            .foregroundColor(Color("rose"))
                            .frame(maxWidth: 110)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .offset(y: 152)
                            .transition(.opacity)
                            .animation(.easeInOut, value: viewModel.selectedName)
                    }
                }
                //MARK: - Button
                NavigationLink{
                    LandingScreenView()
                } label: {
                    Text("OK")
                        .font(.custom("Syncopate-Bold", size: 17))
                        .foregroundStyle(.white)
                        .frame(width: 278, height: 63)
                        .background(.black.opacity(0.85))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
            }.padding(10)
            
            if viewModel.showSnow {
                SnowfallView()
                    .transition(.opacity)
                
            }
            
            ShakeDetector {
                viewModel.handleShake()
            }
            .allowsHitTesting(false)
        }
    }
}
