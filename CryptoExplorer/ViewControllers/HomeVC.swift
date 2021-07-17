//
//  HomeVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/14/21.
//

import UIKit

class HomeVC: UIViewController {
  
  let tableView = UITableView()
  
  var coins = [Item]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    configureTableView()
    startLoad()
  }
  
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  func startLoad() {
    guard let url = URL(string: "https://api.coingecko.com/api/v3/search/trending") else {
      print("URL is invalid")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        print(error)
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        print(response!.debugDescription)
        return
      }
      
      if let mimeType = httpResponse.mimeType, mimeType == "application/json", let data = data {
        
        if let decodedResponse = try? JSONDecoder().decode(TrendingCoins.self, from: data) {
          self.coins = decodedResponse.coins
          DispatchQueue.main.async {
            self.tableView.reloadData()
            print(self.coins)
          }
        } else {
          print("decode failed")
        }
      }
    }
    task.resume()
  }
  
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    coins.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = coins[indexPath.row].name
    return cell
  }
}
