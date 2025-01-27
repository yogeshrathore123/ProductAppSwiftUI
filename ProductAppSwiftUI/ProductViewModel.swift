//
//  ProductViewModel.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 16/01/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    
    private let manager = APIManager()
    
    func fetchProducts()async {
        do {
            products = try await manager.request("https://fakestoreapi.com/products")
            print(products)
            
        } catch {
            print("Fetch Product error: \(error.localizedDescription)")
        }
    }
    
}
