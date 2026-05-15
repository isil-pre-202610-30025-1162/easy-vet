//
//  MainView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Cart", systemImage: "cart") {
                CartView()
            }
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
            Tab("Profiles", systemImage: "person") {
                ProfileView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
