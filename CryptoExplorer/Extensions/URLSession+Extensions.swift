//
//  URLSession+Extensions.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/22/21.
//

import Foundation

extension URLSession {
  enum CustomError: Error {
    case invalidUrl
    case invalidData
    case generalError
  }
  
  func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, CustomError>) -> Void) {
    guard let url = url else {
      completion(.failure(.invalidUrl))
      return
    }
    
    let task = dataTask(with: url) { data, _, error in
      guard let data = data else {
        if let error = error {
          completion(.failure(.generalError))
        } else {
          completion(.failure(.generalError))
        }
        return
      }
      
      do {
        let result = try JSONDecoder().decode(expecting, from: data)
        completion(.success(result))
      } catch {
        completion(.failure(.generalError))
      }
      
    }
    task.resume()
  }
  
}
