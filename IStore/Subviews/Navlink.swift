//
//  Navlink.swift
//  IStore
//
//  Created by Nguyễn Toàn on 21/8/25.
//

import SwiftUI

struct Navlink: View {
    var text: String
    var subText: String
    
    var body: some View {
        HStack {
            Text (text)
            
            Text(subText)
                .font(.system(size: 18, weight: .semibold))
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    VStack {
        Navlink(text: "Forgot", subText: "Password")
        Navlink(text: "Reset", subText: "Password")
    }
}
