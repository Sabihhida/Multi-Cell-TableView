//
//  CardType1CellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit


class TypeOneClass: CellController {
   
    private var model: Model
    let navigation: (() -> ())?

    init(model: Model, push: @escaping (() -> ())) {
        self.model = model
        self.navigation = push
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:String(describing: TypeOneCell.self), for: indexPath) as! TypeOneCell
        cell.buttonPress = { 
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        cell.configCell(item: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigation?()
    }
}
