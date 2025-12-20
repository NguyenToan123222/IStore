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
    @State var isLoading = true
    @State var fetchProducts = FetchProduct()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoading {
                    ProgressView("Loading")
                        .task {
                            await vm.checkLoginStatus()
                            isLoading = false
                        }
                } else if vm.isLogged {
                    MainTabView()
                        .environment(fetchProducts)
                } else {
                    Login()
                }
                
            }.environment(vm)
        }
    }
}
