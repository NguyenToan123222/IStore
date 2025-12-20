//
//  Detail.swift
//  IStore
//
//  Created by Nguyễn Toàn on 17/9/25.
//

import SwiftUI

struct Detail: View {
    
    var product: ProductResponse
    var animation: Namespace.ID
    @State var detailVM: DetailVM
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                AsyncImage(url: URL(string: product.image)) { image in
                    
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .cornerRadius(10)
                    
                } placeholder: {
                    ProgressView()
                }
                VStack (alignment: .leading, spacing: 4) {
                    HStack {
                        Text(product.name)
                            .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Spacer ()
                        Image(systemName: "\(product.category)")
                    }
                    
                }
            }
        }
    }
}
