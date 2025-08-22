//
//  IStoreApp.swift
//  IStore
//
//  Created by Nguyễn Toàn on 19/8/25.
//

import SwiftUI

@main
struct IStoreApp: App {
    @State var vm = AuthVM()
    var body: some Scene {
        WindowGroup {
            Group {
                if false {
                    Login()
                } else {
                    MainTabView()
                }
            }.environment(vm)
        }
    }
}
