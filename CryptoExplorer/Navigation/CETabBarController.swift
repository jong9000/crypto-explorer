//
//  CETabBarController.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class CETabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setViewControllers([ViewController()], animated: false)
  }
  
  
}
