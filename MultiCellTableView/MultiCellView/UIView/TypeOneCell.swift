//
//  CardCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class TypeOneCell: UITableViewCell {

            
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
       
        //step 1 :  Add closure in Tableview cell
        var buttonPress: (() -> Void)?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        func configCell(item: Model) {
            self.titleLabel.text = item.title
            descriptionLabel.text = item.description
        }
        
        @IBAction func didButtonPressed(_ sender: UIButton) {
          //step 2:  call closure button action
            buttonPress?()
        }
}
