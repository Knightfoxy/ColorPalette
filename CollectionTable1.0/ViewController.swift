//
//  ViewController.swift
//  CollectionTable1.0
//
//  Created by Admin on 11/03/22.


import UIKit

var imagecolor : UIColor?

class TableView: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var colorsArray = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")
    }
}

extension TableView: UITableViewDelegate, UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.green
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.text = colorsArray.objectsArray[section].category
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid") as? TableViewCell {
            // Show SubCategory Title
           
            let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
            cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]

            // Pass the data to colletionview inside the tableviewcell
            //cell.cellDelegate = self

            let rowArray = colorsArray.objectsArray[indexPath.section].colors[indexPath.row]
            cell.updateCellWith(row: rowArray)
            return cell
        }
        return UITableViewCell()
    }
}
extension TableView: CollectionViewCellDelegate {
    
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
         
        //imagecolor = UIColor.red
        
        if let colorsRow = didTappedInTableViewCell.rowWithColors {
            //imagecolor =4
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DisplayViewController")
            self.navigationController?.pushViewController(vc, animated: true)
            //imagecolor?.backgroundColor = UIColor.red
            
//            collectionviewcell.
            
            
        }
    }
}
//let storyboard = UIStoryboard(name: "Main", bundle: nil)
//let vc = storyboard.instantiateViewController(identifier: "SecondViewController")
//self.navigationController?.pushViewController(vc, animated: true)
