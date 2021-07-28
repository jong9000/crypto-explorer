//
//  Trending.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/16/21.
//

struct TrendingCoins: Codable {
  var coins: [Item]
}

struct Item: Codable {
  var item: CoinDetails
}

struct CoinDetails: Codable {
  
  let id: String
  let coinID: Int
  let name: String
  let symbol: String
  let marketCapRank: Int
  let thumb: String
  let small: String
  let large: String
  let slug: String
  let priceBTC: Double
  let score: Int
  
  enum CodingKeys: String, CodingKey {
    case id, name, symbol, thumb, small, large, slug, score
    case coinID = "coin_id"
    case marketCapRank = "market_cap_rank"
    case priceBTC = "price_btc"
  }
  
}

