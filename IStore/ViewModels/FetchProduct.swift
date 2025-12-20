//
//  FetchProduct.swift
//  IStore
//
//  Created by Nguyễn Toàn on 3/9/25.
//

import Foundation

@Observable
class FetchProduct {
    var alertTitle = ""
    var alertMessage = ""
    var showAlert: Bool = false
    
    var trendingProducts: [ProductResponse] = []
    var currentPage = 1
    var currentPageTrending =   1
    var totalPagesTrending =   1
    var totalProductsTrending : Int = 0
    
    var currentPageAirpods = 1
    var totalPageAirpods  = 1
    var totalProductAirpod : Int = 0
    var airpods: [ProductResponse] = []

    
    var currentPageIphones = 1
    var totalPageIphones = 1
    var totalProductIphones : Int = 0
    var iphones: [ProductResponse] = []
    
    var currentPageIpads = 1
    var totalPageIpads = 1
    var totalProductIpads : Int = 0
    var ipads: [ProductResponse] = []
    
    var currentPageWatch = 1
    var totalPageWatch = 1
    var totalProductWatch : Int = 0
    var applewatchs: [ProductResponse] = []
    
    var currentPageMac = 1
    var totalPageMac = 1
    var totalProductMac : Int = 0
    var macs: [ProductResponse] = []
    
    func fetchTrendingProducts(page: Int) async throws -> ProductResponseArray {
        guard let url = URLComponents(string: "\(baseURL)/getTrendingProducts?page=\(page)")?.url else {
            throw NetworkError.invalidURL
        }
        do {
            let (responseData, httpResponse) = try await HTTPClient.shared.httpRequest(url: url, method: .GET) as (ProductResponseArray, HTTPURLResponse)
            return responseData
        } catch {
            alertTitle = "Success"
            alertMessage = "Network Response Error"
            showAlert = true
            throw NetworkError.invalidResponse
        }
    }
    func loadTrendingProduct() async {
        guard currentPageTrending <= totalPagesTrending else { return }
        
        alertMessage = ""
        
        do {
            let response = try await fetchTrendingProducts(page: currentPageTrending)
            
            if currentPageTrending == 1 {
                trendingProducts = response.product
            } else {
                trendingProducts.append(contentsOf: response.product)
            }
            
            currentPageTrending += 1
            totalPagesTrending = response.totalPages
            totalPagesTrending = response.totalProducts
        } catch {
            alertTitle = "Error"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
    func fetchCategory(category: ItemCategories) async throws -> ProductResponseArray {
        guard let url = URLComponents(string: "\(baseURL)/products/category/\(category.rawValue )")?.url else {
            throw NetworkError.invalidURL
        }
        do {
            let (responseData, _) = try await HTTPClient.shared.httpRequest(url: url, method: .GET) as (ProductResponseArray, HTTPURLResponse)
            return responseData
        } catch {
            alertTitle = "Success"
            alertMessage = "Network Response Error"
            showAlert = true
            throw NetworkError.invalidResponse
        }
    }
    
    func loadAirpods() async {
        guard currentPageTrending <= totalPagesTrending else { return }
        
        alertMessage = ""
        do {
            let response = try await fetchCategory(category: .airpods)
            if currentPageTrending == 1 {
                airpods = response.product
            } else {
                airpods.append(contentsOf: response.product)
            }
            currentPageAirpods += 1
            totalPageAirpods = response.totalPages
            totalProductAirpod = response.totalProducts
        } catch {
            alertTitle = "Success"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
    
    func loadIphones() async {
        guard currentPageIphones <= totalPageIphones else { return }
        
        alertMessage = ""
        do {
            let response = try await fetchCategory(category: .iphone)
            if currentPageIphones == 1 {
                iphones = response.product
            } else {
                iphones.append(contentsOf: response.product)
            }
            currentPageIphones += 1
            totalPageIphones = response.totalPages
            totalProductIphones = response.totalProducts
        } catch {
            alertTitle = "Success"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
    func loadIpads() async {
        guard currentPageIpads <= totalPageIpads else { return }
        
        alertMessage = ""
        do {
            let response = try await fetchCategory(category: .ipad)
            if currentPageIpads == 1 {
                ipads = response.product
            } else {
                ipads.append(contentsOf: response.product)
            }
            currentPageIpads += 1
            totalPageIpads = response.totalPages
            totalProductIpads = response.totalProducts
        } catch {
            alertTitle = "Success"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
    func loadAppleWatch() async {
        guard currentPageWatch <= totalPageWatch else { return }
        
        alertMessage = ""
        do {
            let response = try await fetchCategory(category: .applewatch)
            if currentPageWatch == 1 {
                applewatchs = response.product
            } else {
                applewatchs.append(contentsOf: response.product)
            }
            currentPageIpads += 1
            totalPageWatch = response.totalPages
            totalProductWatch = response.totalProducts
        } catch {
            alertTitle = "Success"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
    func loadMac() async {
        guard currentPageMac <= totalPageMac else { return }
        
        alertMessage = ""
        do {
            let response = try await fetchCategory(category: .macbook)
            if currentPageWatch == 1 {
                macs = response.product
            } else {
                macs.append(contentsOf: response.product)
            }
            currentPageMac += 1
            totalPageMac = response.totalPages
            totalProductMac = response.totalProducts
        } catch {
            alertTitle = "Success"
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
}
