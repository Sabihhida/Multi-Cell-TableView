//
//  UITableViewExtensions.swift
//  MultiCellView
//
//  Created by Sabih Tahir on 02/03/2023.
//

import UIKit
import Foundation

extension UITableView {
    
    func registerTableViewCell(_ nibArray: [String]) {
        nibArray.forEach {
            self.registerCell($0)
        }
    }
    
    func registerCell(_ identifier: String) {
        self.register(Helper.nib(nibName: identifier), forCellReuseIdentifier: identifier)
    }
}
