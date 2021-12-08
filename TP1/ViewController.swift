//
//  ViewController.swift
//  TP1
//
//  Created by Thibaut Juillard on 08/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var todo =  [Todo]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...5 {
            todo.append(Todo(nom: "Ingrédient " + String(i),
                                 desc: "Description numéro " + String(i) ))
        }
        
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.myLabel.text = todo[indexPath.row].nom
        return cell
    }

}

