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
            Image("BoulesEmptyView")
                .resizable()
                .frame(width: 200, height: 130)
                .scaledToFill()
                
            Text("HOHOHO !")
            Text("Tu n'as pas encore de participant")
            Spacer()

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.beige)
    }
}

#Preview {
    ParticipantEmptyView()
}
