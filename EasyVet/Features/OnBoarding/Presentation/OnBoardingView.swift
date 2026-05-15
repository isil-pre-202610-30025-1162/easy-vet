//
//  OnBoardingView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 16/04/26.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var showLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("From Bowl to Soul").font(Font.largeTitle.bold()).foregroundStyle(.green)
                
                

                FilledButton(text: "Create account") {
                    
                }
                
                
                OutlinedButton(text: "Sign in") {
                    showLogin.toggle()
                }
                
                
            }.navigationDestination(isPresented: $showLogin) {
                LoginView()
            }
        }
    }
}


#Preview {
    OnBoardingView()
        .environmentObject(CartViewModel())
}
