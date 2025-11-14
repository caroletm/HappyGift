//
//  ParticipantEmptyView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct ParticipantEmptyView: View {
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            icon
            description
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("beige"))
    }
    
    var icon : some View{
        Image("BoulesEmptyView")
            .resizable()
            .frame(width: 200, height: 130)
            .scaledToFill()
    }
    
    var description : some View{
        VStack(spacing: 6){
            Text("HOHOHO !")
                .font(.custom("Syncopate-Bold", size: 15))
            Text("Tu n'as pas encore de participant")
                .font(.custom("Syncopate-Regular", size: 12))
        }
    }
}

#Preview {
    ParticipantEmptyView()
}
