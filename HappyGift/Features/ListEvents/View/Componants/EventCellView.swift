//
//  EventCellView.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventCellView: View {
    var RectangleColor: Color
    var RectanglePosition: Double
    var dateEvent: String
    var title: String
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height: CGFloat = 215
            let angle = CGFloat(RectanglePosition * .pi / 180)
            
            let adjustedWidth = width * abs(cos(angle)) + height * abs(sin(angle))
            
            ZStack {
                Rectangle()
                    .fill(RectangleColor)
                    .frame(width: adjustedWidth, height: height)
                    .rotationEffect(.degrees(RectanglePosition))
                
                HStack(alignment: .center, spacing: 130) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(dateEvent)
                            .font(.custom("Syncopate-Bold", size: 24))
                        Text(title)
                            .font(.custom("Syncopate-Regular", size: 14))
                    }
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20))
                }
                .foregroundStyle(RectangleColor == .rose ? .rouge : .beige)
                .padding(.horizontal, 30)
            }
            .frame(width: geo.size.width, height: height)
        }
        .frame(height: 215)
    }
}




#Preview {
    EventCellView(RectangleColor: .rose, RectanglePosition: 0, dateEvent: "22.23.2025", title: "Santa entre petit pote à la compote")
}
