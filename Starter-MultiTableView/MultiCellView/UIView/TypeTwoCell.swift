//
//  Card2Cell.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class TypeTwoCell: UITableViewCell {

    @IBOutlet weak var squareImage: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: Model2) {
        self.squareImage.image = UIImage(named: item.image)
    }
    
    
    
}
