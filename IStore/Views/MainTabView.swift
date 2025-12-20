//
//  MainTabView.swift
//  IStore
//
//  Created by Nguyễn Toàn on 21/8/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selected = 1
    var body: some View {
        TabView {
            Home().tabbarModifier(symbol: "house.cicle", tag: 1)
            Cart().tabbarModifier(symbol: "house.cicle", tag: 2)
            Favourites().tabbarModifier(symbol: "house.cicle", tag: 3)
            Personal().tabbarModifier(symbol: "house.cicle", tag: 4)

        }
    }
}

#Preview {
    MainTabView()
}
