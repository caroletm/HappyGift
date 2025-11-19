////
////  SnowfallVM.swift
////  HappyGift
////
////  Created by Samara Lima da Silva on 12/11/2025.
////
//

import Foundation
import SwiftUI
import Combine
import Observation

enum SnowArea {
    case circle
    case rect
}

@Observable
class SnowfallVM {
    var snowflakes: [Snowflake] = []
    
    private var timer: AnyCancellable?
    private let numberOfSnowflakes: Int
    private let width: CGFloat
    private let height: CGFloat
    private let area: SnowArea

    init(
        numberOfSnowflakes: Int = 100,
        area: SnowArea = .rect,
        width: CGFloat = UIScreen.main.bounds.width,
        height: CGFloat = UIScreen.main.bounds.height
    ) {
        self.numberOfSnowflakes = numberOfSnowflakes
        self.area = area
        self.width = width
        self.height = height
        
        generateSnowflakes()
        startSnowfall()
    }

    private func generateSnowflakes() {
        snowflakes = (0..<numberOfSnowflakes).map { _ in
            Snowflake(
                x: randomX(),
                y: randomY(),
                size: CGFloat.random(in: 2...6),
                speed: Double.random(in: 0.5...2)
            )
        }
    }

    private func randomX() -> CGFloat {
        switch area {
        case .rect:
            return CGFloat.random(in: 0...width)
        case .circle:
            let r = min(width, height) / 2
            return CGFloat.random(in: -r...r) + width/2
        }
    }

    private func randomY() -> CGFloat {
        switch area {
        case .rect:
            return CGFloat.random(in: 0...height)
        case .circle:
            let r = min(width, height) / 2
            return CGFloat.random(in: -r...r) + height/2
        }
    }

    private func startSnowfall() {
        timer = Timer.publish(every: 0.02, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSnowflakes()
            }
    }

    private func updateSnowflakes() {
        for i in 0..<snowflakes.count {
            snowflakes[i].y += snowflakes[i].speed
            
            if snowflakes[i].y > height {
                snowflakes[i].y = -10
                snowflakes[i].x = randomX()
            }
        }
    }
}
