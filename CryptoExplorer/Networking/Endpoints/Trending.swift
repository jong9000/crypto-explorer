//
//  Trending.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/29/21.
//

import Foundation

enum Trending: Endpoint {
  case topSeven
  
  var scheme: String {
    "https"
  }
  
  var baseURL: String {
    "api.coingecko.com"
  }
  
  var path: String {
    "/api/v3/search/trending"
  }
  
  var parameters: [URLQueryItem] {
    []
  }
  
  var method: String {
    "GET"
  }

}
