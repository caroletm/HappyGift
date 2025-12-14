//
//  NavigationViewModel.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import Observation
import Foundation
import SwiftUI

@Observable

 class NavigationViewModel {
    var path = NavigationPath()
     
     //MARK: - Loading page
    
     // MARK: - Loading global
     
     var isLoading: Bool = false
     var frameIndex: Int = 0
     var timer: Timer?

       func start() {
           stop()
           timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
               self.frameIndex = (self.frameIndex + 1) % 4
           }
       }

       func stop() {
           timer?.invalidate()
           timer = nil
           frameIndex = 0
       }
     
}

