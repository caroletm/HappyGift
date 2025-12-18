//
//  ButtonParticipantCellView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct ButtonParticipantCellView: View {
    var title: String
    var function: () -> Void = {}
    var size: CGFloat?
    var body: some View {
        Button {
           function()
        } label: {
            RoundedRectangle(cornerRadius: 50)
                .fill(.black)
                .frame(width: size == nil ?  149 : size, height: 53)
                .overlay{
                    Text(title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color("beige"))
                }
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ButtonParticipantCellView(title: "Ajouter")
}
