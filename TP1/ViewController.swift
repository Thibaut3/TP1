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
    
    func update_todo (task: Todo){
        self.todo.append(task)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.myLabel.text = todo[indexPath.row].nom
        return cell
    }
    
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let TaskView = unwindSegue.source as! CreateTaskView
        if unwindSegue.identifier == "cancel" {
            TaskView.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save" {
            if let myTitle = TaskView.myTitle.text, let myDescription = TaskView.myDesc.text {
                let new_data = Todo(nom: myTitle,desc: myDescription)
                todo.append(new_data)
                myTableView.reloadData()
                }
            }
        }

}
