//
//  ProductItem.swift
//  EasyVet
//
//  Created by Jorge Mayta on 23/04/26.
//

import SwiftUI

struct ProductItem: View {
    var product: Product
    
    @State var showDetail = false
    
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 100, height: 200)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 200)
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            Text(product.name).bold()
            VStack {
                Text(product.description).lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            ProductDetailSheet(product: product){
                showDetail.toggle()
                viewModel.addProduct(product: product)
                
            }.presentationDetents([.fraction(0.25)])
        }
    }
}
