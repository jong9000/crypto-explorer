//
//  Trending.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/16/21.
//

struct TrendingCoins: Decodable {
  var coins: [Item]
}

struct Item: Decodable {
  
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
    case item, id, name, symbol, thumb, small, large, slug, score
    case coinID = "coin_id"
    case marketCapRank = "market_cap_rank"
    case priceBTC = "price_btc"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let item = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .item)
    
    id = try item.decode(String.self, forKey: .id)
    coinID = try item.decode(Int.self, forKey: .coinID)
    name = try item.decode(String.self, forKey: .name)
    symbol = try item.decode(String.self, forKey: .symbol)
    marketCapRank = try item.decode(Int.self, forKey: .marketCapRank)
    thumb = try item.decode(String.self, forKey: .thumb)
    small = try item.decode(String.self, forKey: .small)
    large = try item.decode(String.self, forKey: .large)
    slug = try item.decode(String.self, forKey: .slug)
    priceBTC = try item.decode(Double.self, forKey: .priceBTC)
    score = try item.decode(Int.self, forKey: .score)
  }
  
}

