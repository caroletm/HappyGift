//
//  Loading.swift
//  HappyGift
//
//  Created by caroletm on 12/12/2025.
//

import SwiftUI

struct LoadingView: View {
    
    @Environment(NavigationViewModel.self) var navigationVM
    
    let frames = [
        "candycane1",
        "candycane2",
        "candycane3",
        "candycane4"
        ]

    var body: some View {
        
        ZStack{
            Color.rose
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Patience...")
                    .font(.custom("Syncopate-Bold", size: 16))
                    .foregroundStyle(Color.white)
                Image(frames[navigationVM.frameIndex])
                               .resizable()
                               .scaledToFit()
                               .frame(width: 180, height : 70)
                               .offset(x: -10)
            }
        }
        .onAppear {navigationVM.start() }
         .onDisappear { navigationVM.stop() }
    }
}

#Preview {
    LoadingView()
        .environment(NavigationViewModel())
}

