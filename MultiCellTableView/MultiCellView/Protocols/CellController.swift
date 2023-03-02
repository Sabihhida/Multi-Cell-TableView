//
//  CellController.swift
//  MultiCellView
//
//  Created by Sabih Tahir on 02/03/2023.
//

import UIKit
import Foundation

protocol CellController {
  // required
  func tableView(_ tableView: UITableView, cellForRowAt
       indexPath: IndexPath) -> UITableViewCell
  // optional
   func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath)

}
// Default empty implemenation of protocol extension make it optional
extension CellController {
    func tableView(_ tableView: UITableView,
         didSelectRowAt indexPath: IndexPath) {}
}
