//
//  ProductDetailSheet.swift
//  EasyVet
//
//  Created by Jorge Mayta on 30/04/26.
//

import SwiftUI

struct ProductDetailSheet: View {
    var product: Product
    var onAdd: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 100)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    case .failure:
                        Image(systemName: "photo")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    @unknown default:
                        EmptyView()

                    }
                }
                VStack (alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                    
                    Text("$ \(product.price, specifier: "%.2f") ")
                    
                    Text(product.description)
                        .font(.subheadline)
                }
            }
           
            FilledButton(text: "Add to cart") {
                onAdd()
            }
        }
        .padding(16)
    }
}
