//
//  EventValidJoinCellView.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventValidJoinCellView: View {
    var body: some View {
        VStack(spacing: 8){
            Image("papaNoel")
                .resizable()
                .frame(width: 134, height: 160)
                .padding()
            Text("HOHOHO !!")
                .font(.custom("Syncopate-Bold", size: 15))
            Text("Tu viens de rejoindre l'événement")
                .font(.custom("Syncopate-Regular", size: 11))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.beige)
        
    }
}

#Preview {
    EventValidJoinCellView()
}
