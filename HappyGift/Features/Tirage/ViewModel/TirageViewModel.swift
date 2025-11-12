//
//  TirageViewModel.swift
//  HappyGift
//
//  Created by Samara Lima da Silva on 12/11/2025.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class TirageViewModel: ObservableObject {
    @Published var showSnow = false
    @Published var selectedName: String? = nil
    
    private let name = "Alizé"
//TODO: - name = (the variable Carole uses for the tirage)
    
    func handleShake() {
        withAnimation(.easeOut(duration: 1.0)) {
            showSnow = true
            selectedName = name
        }
    }
}
