//
//  UITableView+Extensions.swift
//  CryptoExplorer
//
//  Created by Jonathan Gentry on 7/19/21.
//

import UIKit

// https://stackoverflow.com/questions/3968037/how-to-deselect-a-selected-uitableview-cell
extension UITableView {
  
  func deselectSelectedRow(animated: Bool)
  {
    if let indexPathForSelectedRow = self.indexPathForSelectedRow {
      self.deselectRow(at: indexPathForSelectedRow, animated: animated)
    }
  }
  
}
