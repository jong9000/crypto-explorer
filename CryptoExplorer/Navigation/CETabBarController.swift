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
    
    UITabBar.appearance().tintColor = .systemGreen
    self.setViewControllers([createHomeVC(), createSearchVC(), createFavoritesVC()], animated: false)
  }
  
  func createHomeVC() -> UIViewController {
    let homeVC = HomeVC()
    homeVC.title = "Home"
    homeVC.tabBarItem.image = UIImage(systemName: "house")
    return homeVC
  }
  
  func createSearchVC() -> UIViewController {
    let searchVC = SearchVC()
    searchVC.title = "Search"
    searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    return searchVC
  }
  
  func createFavoritesVC() -> UIViewController {
    let favoritesVC = FavoritesVC()
    favoritesVC.title = "Favorites"
    favoritesVC.tabBarItem.image = UIImage(systemName: "star")
    return favoritesVC
  }
  
}
