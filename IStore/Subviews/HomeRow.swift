//
//  HomeView.swift
//  IStore
//
//  Created by Nguyễn Toàn on 2/9/25.
//

import SwiftUI

struct HomeRow: View {
    @Binding var selected: ItemCategories
    
    var body: some View {
        HStack {
            Spacer()
            TabButtonView(type: .trending, action: {
                selected = .trending
            }, isSelected: selected == .trending, color: .orange)
            Spacer()
            TabButtonView(type: .airpods, action: {
                selected = .airpods
            }, isSelected: selected == .airpods, color: .blue)
            Spacer()
            TabButtonView(type: .applewatch, action: {
                selected = .applewatch
            }, isSelected: selected == .applewatch, color: .red)
            Spacer()
            TabButtonView(type: .iphone, action: {
                selected = .iphone
            }, isSelected: selected == .iphone, color: .cyan)
            Spacer()
            TabButtonView(type: .ipad, action: {
                selected = .ipad
            }, isSelected: selected == .ipad, color: .green)
            Spacer()
            TabButtonView(type: .macbook, action: {
                selected = .macbook
            }, isSelected: selected == .macbook, color: .yellow)
        }
    }
}



