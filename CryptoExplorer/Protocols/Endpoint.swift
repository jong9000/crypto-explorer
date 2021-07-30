//
//  Endpoint.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/28/21.
//

// https://www.youtube.com/watch?v=nC602u9Z5R4

import Foundation

protocol Endpoint {
  /// HTTP or HTTPS
  var scheme: String { get }
  
  // Example: "api.coingecko.com"
  var baseURL: String { get }
  
  // "/coins/simple"
  var path: String { get }
  
  // [URLQueryItem(name: "currency", value "usd")]
  var parameters: [URLQueryItem] { get }
  
  // "GET"
  var method: String { get }
}
