//
//  ShakeDetector.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import Foundation
import SwiftUI
import UIKit

struct ShakeDetector: UIViewControllerRepresentable {
    var onShake: () -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = ShakeViewController()
        controller.onShake = onShake
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

class ShakeViewController: UIViewController {
    var onShake: (() -> Void)?
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            onShake?()
        }
    }
}
