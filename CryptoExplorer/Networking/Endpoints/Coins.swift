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
      return "/api/v3/coins/list"
    }
  }
  
  var parameters: [URLQueryItem] {
    switch self {
    case .getCoinsList:
      return []
    }
  }
  
  var method: String {
    "GET"
  }

}
