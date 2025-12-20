//
//  TabButtonView.swift
//  IStore
//
//  Created by Nguyễn Toàn on 1/9/25.
//

import SwiftUI

struct TabButtonView: View {
    var type: ItemCategories
    var action: () -> Void
    var isSelected: Bool
    var color: Color
    
    var body: some View {
        Button(action: action) {
            Image(systemName: type.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(isSelected ? color : Color.gray.opacity(0.5))
                .frame(height: 35)
        }
    }
}

