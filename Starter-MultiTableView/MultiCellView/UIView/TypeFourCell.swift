//
//  TypeFourCell.swift
//  MultiCellView
//
//  Created by AkifAhmed on 03/03/2023.
//

import UIKit

class TypeFourCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    // Private variables
    private var model2: [Model2] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(Helper.nib(nibName: String(describing: ItemCVC.self)), forCellWithReuseIdentifier: String(describing: ItemCVC.self))
        // Initialization code
    }

    func configCell(items: [Model2]) {
        self.model2 = items
    }



}

extension TypeFourCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model2.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model2 = model2[indexPath.row] 
        let itemCVC =  collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCVC.self), for: indexPath)
        as? ItemCVC
        itemCVC?.configCell(item: model2)
        return itemCVC ?? ItemCVC()
    }


}
