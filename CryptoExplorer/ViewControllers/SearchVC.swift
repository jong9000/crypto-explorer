//
//  SearchVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class SearchVC: UIViewController {
  
  let tableView = UITableView(frame: .zero)
  let cellID = "cell"
  
  var coins = [CoinsList]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    configureTableView()
    constrainTableView()
    
    fetch()
  }
  
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
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
    NetworkManager.request(endpoint: Coins.getCoinsList) { (result: Result<[CoinsList], Error>) in
      switch result {
      case .success(let response):
        self.coins = response
        self.tableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    coins.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = coins[indexPath.row].name
    return cell
  }
}
