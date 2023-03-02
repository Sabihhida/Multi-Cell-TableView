//
//  BanerCellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit


protocol TypeThreeClassCellProtocol: AnyObject {
    func didTapHide(indexPath: IndexPath)
}

class TypeThreeClass: CellController {
   
    private var model: Model3
   
    weak private var delegate: TypeThreeClassCellProtocol?
    
    init(model: Model3, delegate: TypeThreeClassCellProtocol?) {
        self.model = model
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TypeThreeCell.self), for: indexPath) as! TypeThreeCell
        cell.configCell(item: model, indexPath: indexPath)
               
        cell.didTapHide = { [weak self] _ in
            self?.delegate?.didTapHide(indexPath: indexPath)
        }
        
        return cell
    }
    
}
