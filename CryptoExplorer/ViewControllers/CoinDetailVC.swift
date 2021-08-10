//
//  CoinDetailVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/19/21.
//

import UIKit

class CoinDetailVC: UIViewController {
  
  let coinID: String
  let coin: Item
  let priceLabel = UILabel()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    configurePriceLabel()
    fetch()
  }
  
  init(coin: Item, coinID: String) {
    self.coin = coin
    self.coinID = coinID
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configurePriceLabel() {
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let price = coin.item.priceBTC
    
    priceLabel.text = "$\(price)"
    
    self.view.addSubview(priceLabel)
    
    let marginGuide = view.layoutMarginsGuide
    
    
    NSLayoutConstraint.activate([
      priceLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
      priceLabel.heightAnchor.constraint(equalToConstant: 40),
      priceLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
      priceLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
    ])
  }
  
  func fetch() {
    NetworkManager.request(endpoint: Simple.getSimplePrice(coinID: coinID, vsCurrency: "usd") ) { (result: Result<[String: SimplePrice], Error>) in
      switch result {
      case .success(let response):
        print(self.coinID, response[self.coinID]!)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
