//
//  Home.swift
//  IStore
//
//  Created by Nguyễn Toàn on 30/8/25.
//

import SwiftUI

struct Home: View {
    @Environment(FetchProduct.self) var vm
    
    @State var selected: ItemCategories = .trending
    
    func correspondingView () -> some View {
        switch selected {
        case .trending:
                    let view = ReusableHomeView(
                        title: "Trending",
                        vm: vm,
                        products: vm.trendingProducts,
                        action: {
                            await vm.loadTrendingProduct()
                        },
                        selectedTab: ItemCategories.trending,
                        selected: $selected
                    )
                    return AnyView(view)
        case .ipad:
            let view = ReusableHomeView(title: "Ipad", vm: vm, products: vm.ipads, action: {
                await vm.loadIpads()
            }, selectedTab: .ipad, selected: $selected)
            return AnyView(view)
        case .iphone:
            let view = ReusableHomeView(title: "Iphone", vm: vm, products: vm.iphones, action: {
                await vm.loadAirpods()
            }, selectedTab: .iphone, selected: $selected)
            return AnyView(view)
        case .macbook:
            let view = ReusableHomeView(title: "Macbook", vm: vm, products: vm.macs, action: {
                await vm.loadMac()
            }, selectedTab: .airpods, selected: $selected)
            return AnyView(view)
        case .airpods:
            let view = ReusableHomeView(title: "Airpod", vm: vm, products: vm.airpods, action: {
                await vm.loadAirpods()
            }, selectedTab: .airpods, selected: $selected)
            return AnyView(view)
        case .applewatch:
            let view = ReusableHomeView(title: "Apple Watch", vm: vm, products: vm.applewatchs, action: {
                await vm.loadAppleWatch()
            }, selectedTab: .applewatch, selected: $selected)
            return AnyView(view)
        }
    }
    var body: some View {
        @Bindable var viewModel = vm
        VStack {
            HomeRow(selected: $selected)
            correspondingView()
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {
                
            }
        } message: {
            Text(viewModel.alertMessage)
        }
        .navigationTitle("IStore")
        .navigationBarTitleDisplayMode(.inline)
    }
}


