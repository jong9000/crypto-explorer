//
//  SimplePrice.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/29/21.
//

struct SimplePrice: Codable {
  let bitcoin: Coin
}

struct Coin: Codable {
  let usd: Int
}
