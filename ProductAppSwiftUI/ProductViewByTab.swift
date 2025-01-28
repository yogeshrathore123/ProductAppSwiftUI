//
//  ProductViewByTab.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 27/01/25.
//

import SwiftUI

struct ProductViewByTab: View {
    
    let products: [ProductModel]
    
    @State private var currentIndex: Int = 0
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {

        NavigationView {
            
                VStack {
                    TabView(selection: $currentIndex) {
                        ForEach(products) { product in
                            showProductItem(product: product)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .navigationBarTitleDisplayMode(.inline)
                    .onReceive(timer) { _ in
                        withAnimation {
                            currentIndex = (currentIndex + 1) % products.count
                        }
                    }
                    
                }
        }
    }
    
    func showProductItem(product: ProductModel) -> some View {
        VStack(spacing: 16) {
            AsyncImageView(imageURL: product.image)
                .scaledToFit()
                .frame(height: 300)
            
            Text(product.title)
                .font(.headline)
                
            
            Text(product.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            RatingInfoView(product: product)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Price")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.indigo)
                }
                .padding(.leading)
                
                Spacer()
                
                HStack {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Buy Now")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 100)
                }
                .foregroundStyle(.white)
                .frame(height: 50)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: .indigo, location: 0.3),
                                    Gradient.Stop(color: .indigo, location: 0.1),
                                    Gradient.Stop(color: .gray, location: 0.1),
                                    Gradient.Stop(color: .gray, location: 0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                )
                .padding(.trailing)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)

        }
        .padding()
            
    }
}

#Preview {
    ProductViewByTab(products: [ProductModel.sampleData])
}
