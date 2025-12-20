//
//  ProductCell.swift
//  IStore
//
//  Created by Nguyễn Toàn on 3/9/25.
//

import SwiftUI

struct ProductCell: View {
    var product: ProductResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: product.image)) { image in
                
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            } .overlay(alignment: .topTrailing) {
                Button (action: {
                    print("Pressed")
                }) {
                    Image(systemName: "heart.fill")
                        .offset(x: -10, y: 10)
                        .foregroundStyle(Color.red)
                }

            }
            Text(product.name)
                .font(.title3)
                .allowsTightening(true)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Text("$\(String(format: "%.2f", product.price))")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }
    }
}

//#Preview {
//    ProductCell()
//}
