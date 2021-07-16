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
        print(error)
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        print(response)
        return
      }
      
      guard let data = data else {
        print("no data")
        return
      }
      
      print(data)
      
    }
    task.resume()
  }
  
  
}
