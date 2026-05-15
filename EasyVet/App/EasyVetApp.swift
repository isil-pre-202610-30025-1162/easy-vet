//
//  EasyVetApp.swift
//  EasyVet
//
//  Created by Jorge Mayta on 9/04/26.
//

import SwiftUI

@main
struct EasyVetApp: App {
    @StateObject var cartViewModel = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
                .environmentObject(cartViewModel)
        }
    }
}
