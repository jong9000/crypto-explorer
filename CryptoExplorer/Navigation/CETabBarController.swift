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
    self.setViewControllers([createHomeNC(), createSearchNC(), createFavoritesNC()], animated: false)
  }
  
  func createHomeNC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.title = "Home"
    homeVC.tabBarItem.image = UIImage(systemName: "house")
    
    let homeNC = UINavigationController(rootViewController: homeVC)
    homeNC.navigationBar.prefersLargeTitles = true
    return homeNC
  }
  
  func createSearchNC() -> UINavigationController {
    let searchVC = SearchVC()
    searchVC.title = "Search"
    searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    
    let searchNC = UINavigationController(rootViewController: searchVC)
    searchNC.navigationBar.prefersLargeTitles = true
    return searchNC
  }
  
  func createFavoritesNC() -> UINavigationController {
    let favoritesVC = FavoritesVC()
    favoritesVC.title = "Favorites"
    favoritesVC.tabBarItem.image = UIImage(systemName: "star")
    
    let favoritesNC = UINavigationController(rootViewController: favoritesVC)
    favoritesNC.navigationBar.prefersLargeTitles = true
    return favoritesNC
  }
  
}
