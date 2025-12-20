//
//  TabViewModifier.swift
//  IStore
//
//  Created by Nguyễn Toàn on 30/8/25.
//

import SwiftUI

struct TabViewModifier: ViewModifier {
    
    var symbol: String
    var tag: Int
    
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                Image(systemName: symbol)
            }
            .tag(tag)
    }
}

