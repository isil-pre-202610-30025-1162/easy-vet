//
//  HomeView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                ProductItem(product: product)
            }
        }
    }
}


#Preview {
    HomeView()
}
