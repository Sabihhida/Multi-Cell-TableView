//
//  ViewExtensions.swift
//  MultiCellView
//
//  Created by Sabih Tahir on 02/03/2023.
//


import UIKit
import Foundation
// MARK: - Nib init
class Helper  {
    class func nib(nibName: String) -> UINib {
        return UINib.init(nibName: nibName, bundle: nil)
    }
}
