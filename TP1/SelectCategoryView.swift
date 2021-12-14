//
//  SelectCategoryView.swift
//  TP1
//
//  Created by Thomas Miramon on 14/12/2021.
//

import UIKit

class SelectCategoryView: UIViewController, UITableViewDataSource{
    
   
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var categoryList = [Category] ()

    
    var flag=false
    var category: [Category] =  []
    @IBOutlet weak var myTableView: UITableView!
    
    //var cellule = self.myTableView.cellForRowAtIndexPath()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "firsCellType", for: indexPath) as! FirstTableVieawCellCategory
        cell.myTitle.text = category[indexPath.row].name
        
        return cell
    }
    
    @IBAction func myButton_released(_ sender: Any) {
        var element = Category(name: self.myTextField.text!,state: false )
        category.append(element)
        myTableView.reloadData()
        categoryList.append(Category(name: self.myTextField.text!, state: false))
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for element in categoryList {
            category.append(element)
        }

        
        
        myTableView.dataSource = self
    }
    
    @IBAction func save_clicked(_ sender: Any) {
      //  for row in
    }
    
}
