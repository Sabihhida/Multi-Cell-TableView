//
//  ItemCVC.swift
//  MultiCellView
//
//  Created by AkifAhmed on 03/03/2023.
//

import UIKit

class ItemCVC: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: Model2) {
        debugPrint(item.image)
        if let imgView = self.itemImageView {
            imgView.image = UIImage(named: item.image)
        }
    }
}
