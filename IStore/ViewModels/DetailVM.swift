//
//  DetailVM.swift
//  IStore
//
//  Created by Nguyễn Toàn on 7/9/25.
//

import Foundation

@Observable
class DetailVM {
    var alertTitle = ""
    var alerMessage = ""
    var showAlert: Bool = false
    
    
    func increaseProductView(productId: String) async {
        guard let url = URLComponents(string: "\(baseURL)/products/\(productId)/views")?.url else {
            alertTitle = "Error"
            alerMessage = "Error creating URL"
            showAlert = true
            return
        }
        do {
            do {
                let (responseData,  _) = try await HTTPClient.shared.httpRequest(url: url, method: .GET) as (EmptyResponse, HTTPURLResponse)
            } catch {
                alertTitle = "Success"
                alerMessage = "Fail to Increase Product View"
                showAlert = true
                
            }
        }
    }
}
