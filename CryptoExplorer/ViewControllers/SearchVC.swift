//
//  SearchVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class SearchVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    fetch()
  }
  
  func fetch() {
    NetworkManager.request(endpoint: Coins.getCoinsList) { (result: Result<[CoinsList], Error>) in
      switch result {
      case .success(let response):
        print(response)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
