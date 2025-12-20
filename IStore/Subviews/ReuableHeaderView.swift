//
//  ReuableHeaderView.swift
//  IStore
//
//  Created by Nguyễn Toàn on 4/9/25.
//

import SwiftUI

struct ReuableHeaderView: View {
    
    var selectedTab: ItemCategories
    
    var body: some View {
        HStack {
            Spacer ()
            Text (selectedTab.rawValue == "star.fill" ? "trending" : "\(selectedTab.rawValue)")
                .font(.title)
            
            Spacer()
        }
    }
}


