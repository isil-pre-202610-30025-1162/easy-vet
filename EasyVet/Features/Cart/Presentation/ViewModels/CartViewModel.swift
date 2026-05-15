//
//  CartViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 7/05/26.
//

import Combine

class CartViewModel: ObservableObject {
    
    @Published var products = [Product]()
    
    
    func addProduct(product: Product){
        self.products.append(product)
    }
    
}
