//
//  Coins.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 8/18/21.
//

import Foundation

enum Coins: Endpoint {
  case getCoinsList
  
  var scheme: String {
    "https"
  }
  
  var baseURL: String {
    "api.coingecko.com"
  }
  
  var path: String {
    switch self {
    case .getCoinsList:
      return "/coins/list"
    }
  }
  
  var method: String {
    "GET"
  }
  
  var parameters: [URLQueryItem] {
    switch self {
    case .getCoinsList:
      return []
    }
  }
}
