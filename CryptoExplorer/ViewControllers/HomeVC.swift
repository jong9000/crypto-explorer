//
//  HomeVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class HomeVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    NetworkManager.shared.getTrending()
  }
  
}
