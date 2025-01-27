//
//  ProductRowView.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 16/01/25.
//

import SwiftUI

struct ProductRowView: View {
    
    let product: ProductModel
    
    var body: some View {
        HStack(spacing: 8) {
            if let imageURL = URL(string: product.image) {
                productImage(url: imageURL)

             }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                HStack {
                    Text(product.category)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text(product.rating.rate.toString())
                    }
                    .font(.headline)
                    .foregroundStyle(.yellow)
                }
                
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                HStack {
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    buyButton
                }
                    
            }
        }
        .padding()
       
    }
    
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
    
    var buyButton: some View {
        Button {
            
        } label: {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.indigo)
                .clipShape(.capsule)
        }

    }
}

#Preview {
    ProductRowView(product: ProductModel.sampleData)
}
