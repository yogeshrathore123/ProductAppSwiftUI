//
//  RatingInfoView.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 24/01/25.
//

import SwiftUI

struct RatingInfoView: View {
    
    let product: ProductModel
    
    var body: some View {
        HStack {
            
            HStack {
                
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                
                Text(product.rating.rate.toString() + " Ratings")
                    .foregroundStyle(.secondary)
            }
            
            
            Spacer()
            
            circleImageView
            Text("4.6k Reviews")
            
            Spacer()
            
            circleImageView
            Text("4.2k Sold")
            
        }
        .foregroundStyle(.secondary)
        .font(.callout)
        
    }
    
    var circleImageView: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 10, height: 10)
    }
}

#Preview {
    RatingInfoView(product: ProductModel.sampleData)
}
