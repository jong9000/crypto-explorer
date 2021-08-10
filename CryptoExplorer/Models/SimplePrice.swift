//
//  SimplePrice.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/29/21.
//

struct SimplePrice: Codable {
  var usd: Double
  var usdMarketCap: Double?
  var usd24hVol: Double?
  var usd24hChange: Double?
  var lastUpdatedAt: Int?
  
  enum CodingKeys: String, CodingKey {
    case usd
    case usdMarketCap = "usd_market_cap"
    case usd24hVol = "usd_24h_vol"
    case usd24hChange = "usd_24h_change"
    case lastUpdatedAt = "last_updated_at"
  }
}



