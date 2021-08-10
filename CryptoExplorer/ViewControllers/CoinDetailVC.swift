//
//  CoinDetailVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/19/21.
//

import UIKit

class CoinDetailVC: UIViewController {
  
  let coin: Item
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    print(coin)
  }
  
  init(coin: Item) {
    self.coin = coin
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
