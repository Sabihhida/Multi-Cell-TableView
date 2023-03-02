//
//  BannerCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 9.11.22..
//

import UIKit

class TypeThreeCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var hideButton: UIButton!
   
    var indexPath: IndexPath?
    
    var didTapHide: ((IndexPath) -> Void)?
    var didTapSeeAll: (() -> Void)?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func configCell(item: Model3, indexPath: IndexPath?) {
        self.indexPath = indexPath
        
        titleLabel.text = item.time
        subTitleLabel.text = item.description
        priceLabel.text = item.price
        monthLabel.text = "Monthly"
     
    }
    
    
    @IBAction func didTapAll(_ sender: UIButton) {
       didTapSeeAll?()
    }
    
    @IBAction func didTapHide(_ sender: UIButton) {
        guard let indexPath else { return }
        didTapHide?(indexPath)
    }
    
}
