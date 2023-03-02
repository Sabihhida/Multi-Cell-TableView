//
//  ViewController.swift
//  MultiCellView
//
//  Created by Sabih Tahir on 01/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    // Private variables
    private var data: [CellController] = []
    
    fileprivate func pushDetailView() {
        if let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    fileprivate func setData() {
        let typeOne = TypeOneClass(model: model1,
                                   push: { [weak self] in
            self?.pushDetailView()
        })
        self.data.append(typeOne)
        let typeTwo = TypeTwoClass(model: model2)
        self.data.append(typeTwo)
        let typeThree = TypeThreeClass(model: model3, delegate: self)
        self.data.append(typeThree)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Holiday Book"
        
        setData()
        
        self.tableView.registerTableViewCell([String(describing: TypeOneCell.self),
                                          String(describing: TypeTwoCell.self),
                                          String(describing: TypeThreeCell.self)])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let controller = data[indexPath.row]
        return controller.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].tableView(tableView, didSelectRowAt: indexPath)
    }
}
extension ViewController: TypeThreeClassCellProtocol {
    func didTapHide(indexPath: IndexPath) {
        self.data.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
