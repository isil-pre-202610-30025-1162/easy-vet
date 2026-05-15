//
//  ProductService.swift
//  EasyVet
//
//  Created by Jorge Mayta on 14/05/26.
//

import Foundation

class ProductService {
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        let endpoint = "https://petapi-591531460223.us-central1.run.app/api/products"
        
        let url = URL(string: endpoint)
        
        guard let url = url else {
            print("Wrong URL")
            completion([Product]())
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print("Error")
                completion([Product]())
                return
            }
            
            guard let data = data else {
                print("No data")
                completion([Product]())
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductsResponseDto.self, from: data)
                let products = productsResponse.products.map { productDto in
                    Product(id: productDto.id,
                            name: productDto.title,
                            price: productDto.price,
                            description: productDto.description,
                            image: productDto.image)
                }
                completion(products)

            } catch {
                print("Decoding error")
                completion([Product]())
            }
        }
        
        task.resume()
  
    }
    
}
