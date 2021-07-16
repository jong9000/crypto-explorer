//
//  NetworkingManager.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/16/21.
//

import Foundation

class NetworkManager {
  
  static let shared = NetworkManager()
  private let baseURL = "https://api.coingecko.com/api/v3"
  
  private init() {}
  
  func getTrending() {
    
    let endpoint = "\(baseURL)/search/trending"
    
    guard let url = URL(string: endpoint) else {
      print("endpoint fail")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let _ = error {
        print(error.debugDescription)
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        print(response!.debugDescription)
        return
      }
      
      if let mimeType = httpResponse.mimeType, mimeType == "application/json", let data = data {
        if let decodedResponse = try? JSONDecoder().decode(TrendingCoins.self, from: data) {
          print(decodedResponse)
        } else {
          print("decode failed")
        }
      }
    }
    task.resume()
  }
}
