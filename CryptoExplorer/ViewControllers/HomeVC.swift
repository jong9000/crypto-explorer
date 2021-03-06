//
//  HomeVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class HomeVC: UIViewController {
  
  let tableView = UITableView(frame: .zero, style: .insetGrouped)
  let cellID = "cell"
  
  var coins = [Item]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    configureTableView()
    constrainTableView()

    fetch()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.deselectSelectedRow(animated: true)
  }
      
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    tableView.sectionHeaderHeight = CGFloat(50)
  }
  
  func constrainTableView() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
        
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  func fetch() {
    NetworkManager.request(endpoint: Trending.topSeven) { (result: Result<TrendingCoins, Error>) in
      switch result {
      case .success(let response):
        self.coins = response.coins
        self.tableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20)
    label.text = "Trending Coins"
    return label
  }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    coins.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = coins[indexPath.row].item.name
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCoin = coins[indexPath.row]
    
    let coinDetailVC = CoinDetailVC(coinID: selectedCoin.item.id)
    
    coinDetailVC.title = selectedCoin.item.name
    coinDetailVC.urlString = selectedCoin.item.large
    
    navigationController?.pushViewController(coinDetailVC, animated: true)
  }
  
}
