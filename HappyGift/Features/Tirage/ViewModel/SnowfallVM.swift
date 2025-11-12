//
//  SnowfallVM.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class SnowfallVM: ObservableObject {
    @Published var snowflakes: [Snowflake] = []
    
    private var timer: AnyCancellable?
    private let numberOfSnowflakes: Int
    private let size: CGFloat

    init(numberOfSnowflakes: Int = 100, size: CGFloat = 250) {
        self.numberOfSnowflakes = numberOfSnowflakes
        self.size = size
        generateSnowflakes()
        startSnowfall()
    }

    private func generateSnowflakes() {
        snowflakes = (0..<numberOfSnowflakes).map { _ in
            Snowflake(
                x: CGFloat.random(in: 0...size),
                y: CGFloat.random(in: 0...size),
                size: CGFloat.random(in: 2...6),
                speed: Double.random(in: 0.5...2)
            )
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
            if snowflakes[i].y > size {
                snowflakes[i].y = -10
                snowflakes[i].x = CGFloat.random(in: 0...size)
            }
        }
    }
}
