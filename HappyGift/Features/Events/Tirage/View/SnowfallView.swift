//
//  SnowfallView.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import SwiftUI

struct SnowfallView: View {
    @Environment(SnowfallVM.self)var snowfallVM

//    var size: CGFloat
//
//    init(size: CGFloat = 250, snowCount: Int = 100) {
//        _viewModel = StateObject(wrappedValue: SnowfallVM(numberOfSnowflakes: snowCount, size: size))
//        self.size = size
//    }
    
    var size: CGFloat
      
    init(size: CGFloat = 450, snowCount: Int = 80) {
          self.size = size
      }

    var body: some View {
        Canvas { context, _ in
            for flake in snowfallVM.snowflakes {
                let position = CGPoint(x: flake.x, y: flake.y)
                let radius = flake.size
                context.fill(
                    Path(ellipseIn: CGRect(
                        x: position.x - radius,
                        y: position.y - radius,
                        width: radius * 2,
                        height: radius * 2
                    )),
                    with: .color(.white)
                )
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .allowsHitTesting(false)
    }
}

#Preview {
    ZStack {
        Color.vert.ignoresSafeArea()
        SnowfallView(size: 250)
            .environment(SnowfallVM(
                   numberOfSnowflakes: 100,
                   area: .circle,
                   width: 300,
                   height: 300
               ))
            .overlay(
                Circle().stroke(Color.white.opacity(0.5), lineWidth: 3)
            )
    }
}
