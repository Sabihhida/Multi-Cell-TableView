//
//  ViewController.swift
//  MultiCellView
//
//  Created by Sabih Tahir on 01/03/2023.
//

import UIKit
enum CellType : Equatable {
    case one
    case two
    case three
    case four
}
struct Data {
    let model : Any
    let type : CellType
}
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    // Private variables
    private var data: [Data] = []
    
    fileprivate func pushDetailView() {
        if let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    fileprivate func setData() {
        self.data.append(Data(model: model1, type: .one))
        self.data.append(Data(model: model2, type: .two))
        self.data.append(Data(model: model3, type: .three))
        var array: [Model2] = [model4, model4, model4, model4, model4]
        self.data.append(Data(model: array, type: .four))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Holiday Book"
        
        setData()
        
        self.tableView.registerTableViewCell([String(describing: TypeOneCell.self),
                                          String(describing: TypeTwoCell.self),
                                          String(describing: TypeThreeCell.self),
                                              String(describing: TypeFourCell.self)])
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
        let type = data[indexPath.row].type

        if type == .one {
            let model: Model = data[indexPath.row].model as! Model
            let typeCellOne = tableView.dequeueReusableCell(withIdentifier:
                                                                String(describing: TypeOneCell.self),
                                                            for: indexPath as IndexPath) as? TypeOneCell
            typeCellOne?.configCell(item: model)
            return  typeCellOne ?? TypeOneCell()

        } else if type == .two {
            let model: Model2 = data[indexPath.row].model as! Model2
            let typeCellTwo = tableView.dequeueReusableCell(withIdentifier:
                                                                String(describing: TypeTwoCell.self),
                                                            for: indexPath as IndexPath) as? TypeTwoCell
            typeCellTwo?.configCell(item: model)
            return  typeCellTwo ?? TypeTwoCell()

        } else if type == .three {
            let model: Model3 = data[indexPath.row].model as! Model3
            let typeCellThree = tableView.dequeueReusableCell(withIdentifier:
                                                                String(describing: TypeThreeCell.self),
                                                              for: indexPath as IndexPath) as? TypeThreeCell
            typeCellThree?.configCell(item: model, indexPath: indexPath)
            typeCellThree?.didTapHide = { indexPath in
                self.data.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            return  typeCellThree ?? TypeThreeCell()
        }
        let model: [Model2] = data[indexPath.row].model as! [Model2]
        let typeFourCell = tableView.dequeueReusableCell(withIdentifier:
                                                            String(describing: TypeFourCell.self),
                                                          for: indexPath as IndexPath) as? TypeFourCell
        typeFourCell?.configCell(items: model)
        return  typeFourCell ?? TypeFourCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = data[indexPath.row].type
        if type == .one {
           pushDetailView()
        }
    }
}

