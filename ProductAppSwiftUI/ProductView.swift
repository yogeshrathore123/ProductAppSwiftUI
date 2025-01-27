//
//  ProductView.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 16/01/25.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductRowView(product: product)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProducts()
        }
        
    }
}

#Preview {
    ProductView()
}
