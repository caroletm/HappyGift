//
//  Snowflake.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import Foundation
import SwiftUI

struct Snowflake: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var speed: Double
}
