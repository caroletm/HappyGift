//
//  ButtonParticipantCellView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct ButtonParticipantCellView: View {
    var function: () -> Void = {}
    var body: some View {
        Button {
           function()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black)
                .frame(width: 149, height: 53)
                .overlay{
                    Text("Ajouter")
                        .font(.system(size: 15).width(.expanded).bold())
                        .foregroundStyle(.beige)
                }
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ButtonParticipantCellView()
}
