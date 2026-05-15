//
//  HomeViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 14/05/26.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    private let productService = ProductService()
    
    @Published var products = [Product]()
    
    func getProducts() {
        productService.getProducts { products in
            DispatchQueue.main.async {
                self.products = products
            }
        }
    }
    
    init () {
        getProducts()
    }
}
