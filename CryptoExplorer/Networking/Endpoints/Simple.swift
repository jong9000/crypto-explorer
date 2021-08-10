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
    "https"
  }
  
  var baseURL: String {
    "api.coingecko.com"
  }
  
  var path: String {
    switch self {
    case .getSimplePrice:
      return "/api/v3/simple/price"
    }
  }
  
  var method: String {
    "GET"
  }
  
  var parameters: [URLQueryItem] {
    switch self {
    case .getSimplePrice(let coinID, let vsCurrency):
      return [URLQueryItem(name: "ids", value: coinID),
              URLQueryItem(name: "vs_currencies", value: vsCurrency),
              URLQueryItem(name: "include_market_cap", value: "true"),
              URLQueryItem(name: "include_24hr_vol", value: "true"),
              URLQueryItem(name: "include_24hr_change", value: "true"),
              URLQueryItem(name: "include_last_updated_at", value: "true")
      ]
    }
  }
}
