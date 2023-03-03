//
//  Card2Cell.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class TypeTwoCell: UITableViewCell {

    @IBOutlet weak var largeImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: Model2) {
        self.largeImage.image = UIImage(named: item.image)
    }
    
    
    
}
