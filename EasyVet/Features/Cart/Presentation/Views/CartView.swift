//
//  CartView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.products) { product in
                Text(product.name)
                    
            }
            .onDelete { indexSet in
                
            }
            
        }
    }
}
