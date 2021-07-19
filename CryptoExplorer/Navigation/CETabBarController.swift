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
  
  func createHomeVC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.title = "Home"
    homeVC.tabBarItem.image = UIImage(systemName: "house")
    return UINavigationController(rootViewController: homeVC)
  }
  
  func createSearchVC() -> UINavigationController {
    let searchVC = SearchVC()
    searchVC.title = "Search"
    searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    return UINavigationController(rootViewController: searchVC)
  }
  
  func createFavoritesVC() -> UINavigationController {
    let favoritesVC = FavoritesVC()
    favoritesVC.title = "Favorites"
    favoritesVC.tabBarItem.image = UIImage(systemName: "star")
    return UINavigationController(rootViewController: favoritesVC)
  }
  
}
