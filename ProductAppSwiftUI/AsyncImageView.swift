//
//  AsyncImageView.swift
//  ProductAppSwiftUI
//
//  Created by Yogesh Rathore on 24/01/25.
//

import SwiftUI

struct AsyncImageView: View {
    
    let imageURL: String
    
    var body: some View {
        
        if let url = URL(string: imageURL) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }

        } else {
            ProgressView()
        }
    }
}

#Preview {
    AsyncImageView(imageURL: ProductModel.sampleData.image)
}
