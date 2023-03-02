//
//  CardType2CellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit

class TypeTwoClass: CellController {
   
    private var model: Model2

    init(model: Model2) {
        self.model = model
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: TypeTwoCell.self), for: indexPath) as! TypeTwoCell
        cell.configCell(item: model)
        return cell
    }
}
