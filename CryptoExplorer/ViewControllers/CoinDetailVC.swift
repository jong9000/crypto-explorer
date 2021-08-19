//
//  CoinDetailVC.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/19/21.
//

import UIKit

class CoinDetailVC: UIViewController {
  
  let coinID: String
  var urlString = "https://jongentry.dev"
  
  private let priceLabel = UILabel()
  private let imageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    return imageView
  }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    configurePriceLabel()
    configureImage()
    fetchImage()
    fetch()
  }
  
  init(coinID: String) {
    self.coinID = coinID
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configurePriceLabel() {
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
    view.addSubview(priceLabel)
    
    let marginGuide = view.layoutMarginsGuide
    
    NSLayoutConstraint.activate([
      priceLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
      priceLabel.heightAnchor.constraint(equalToConstant: 40),
      priceLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
      priceLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
    ])
  }
  
  func configureImage() {
    view.addSubview(imageView)
    imageView.center = view.center
  }
  
  func fetchImage() {
    
    guard let url = URL(string: urlString) else {
      return
    }
    
    let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      DispatchQueue.main.async {
        let image = UIImage(data: data)
        self.imageView.image = image
      }
    }
    getDataTask.resume()
    
  }
  
  
  func fetch() {
    NetworkManager.request(endpoint: Simple.getSimplePrice(coinID: coinID, vsCurrency: "usd") ) { (result: Result<[String: SimplePrice], Error>) in
      switch result {
      case .success(let response):
        DispatchQueue.main.async {
          self.priceLabel.text = "$\(response[self.coinID]!.usd)"
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
