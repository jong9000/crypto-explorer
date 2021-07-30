//
//  Simple.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/29/21.
//

import Foundation

enum Simple: Endpoint {
  case getSimplePrice(coinID: String, vsCurrency: String)
  
  var scheme: String {
    switch self {
    default:
      return "https"
    }
  }
  
  var baseURL: String {
    switch self {
    default:
      return "api.coingecko.com"
    }
  }
  
  var path: String {
    switch self {
    case .getSimplePrice:
      return "/api/v3/simple/price"
    }
  }
  
  var parameters: [URLQueryItem] {
    switch self {
    case .getSimplePrice(let coinID, let vsCurrency):
      return [URLQueryItem(name: "ids", value: coinID),
              URLQueryItem(name: "vs_currencies", value: vsCurrency),
      ]
    }
  }
  
  var method: String {
    switch self {
    default:
      return "GET"
    }
  }
  
}
