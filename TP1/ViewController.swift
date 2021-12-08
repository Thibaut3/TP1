//
//  ViewController.swift
//  TP1
//
//  Created by Thibaut Juillard on 08/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var todo =  [[Todo](),[Todo](),[Todo](),[Todo]()]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...5 {
            todo[0].append(Todo(nom: "Ingrédient " + String(i),
                                 desc: "Description numéro " + String(i) ))
        }
        for i in 1...3{
            todo[1].append(Todo(nom: "Ingrédient " + String(i),
                                 desc: "Description numéro " + String(i) ))
        }
        
        myTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        var headerTitre = ""
        switch section {
        case 0:
            headerTitre  = "Today"
        case 1:
            headerTitre = "Tomorrow"
        case 2:
            headerTitre = "This Week"
        case 3:
            headerTitre = "Later"
        default:
            headerTitre = ""
        }
       return headerTitre
    }

    // Create a standard footer that includes the returned text.
    func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.myLabel.text = todo[indexPath.section][indexPath.row].nom
        return cell
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            todo.remove(at: row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! DetailsViewController
            let myIndexPath = myTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailsViewController.todo = todo[0][row]
        }
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
