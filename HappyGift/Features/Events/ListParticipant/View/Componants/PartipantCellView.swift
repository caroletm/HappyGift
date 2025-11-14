//
//  PartipantCellView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct PartipantCellView: View {
    let name: String
    let tel: String
    let email: String
    let bouleType: String
    var body: some View {
        HStack(spacing: 30){
            Image(bouleType)
                .resizable()
                .frame(width: 55, height: 60)
            VStack(alignment: .leading, spacing: 6){
                Text(name)
                    .font(.custom("Syncopate-Bold", size: 12))
                    .bold()
                Text(tel)
                    .font(.custom("Syncopate-Regular", size: 12))
                Text(email)
                    .font(.custom("Syncopate-Regular", size: 12))
          
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    PartipantCellView(name: "Sébastien", tel: "0655432178", email: "seb@gmail.com", bouleType: "BouleParticipantRed")
}
