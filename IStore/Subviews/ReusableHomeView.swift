//
//  ReusableHomeView.swift
//  IStore
//
//  Created by Nguyễn Toàn on 4/9/25.
//

import SwiftUI

struct ReusableHomeView: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @Namespace var animation
    var title: String
    var vm: FetchProduct
    var products: [ProductResponse]
    var action: () async -> Void
    var selectedTab: ItemCategories
    @Binding var selected: ItemCategories 
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            LazyVGrid (columns: columns, spacing: 8) {
                Section {
                    ForEach(products) { product in
                        ProductCell(product: product)
                    }
                } header: {
                    ReuableHeaderView(selectedTab: selectedTab)
                }
            }
            .task {
                await action()
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .onScrollTargetVisibilityChange(idType: ProductResponse.ID.self, threshold: 0.3) { id in
                if let last = products.last, id.contains(where: {
                    $0 == last.id
                }) {
                    Task {
                        await action ()
                    }
                }
            }
            .onChange(of: selected) { _, newValue in
                if newValue == selected && products.isEmpty {
                    Task {
                        await action()
                    }
                }
            }
        }
    }
}


