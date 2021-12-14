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
    
    var flag=false
    var category: [Category] =  []
    @IBOutlet weak var myTableView: UITableView!
    
    
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
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...5 {
            category.append(Category(name: "Ingrédient ",state: false ))
        }

        
        myTableView.dataSource = self
    }
}
