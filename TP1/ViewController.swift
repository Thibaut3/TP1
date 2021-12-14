//
//  ViewController.swift
//  TP1
//
//  Created by Thibaut Juillard on 08/12/2021.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource {
    
    var todo =  [[Todo](),[Todo](),[Todo](),[Todo]()]
    
    var categoryList = [Category] ()

    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myFiltre: UITextField!
    
    @IBAction func searchCategorie(_ sender: UIButton) {
        let text = myFiltre.text
        myTableView.deleteSections(IndexSet.init(integer: 1), with: .fade)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...5 {
            todo[0].append(Todo(nom: "Ingrédient " + String(i),
                                 desc: "Description numéro " + String(i), categories: [] ))
        }
        for i in 1...3{
            todo[1].append(Todo(nom: "Ingrédient " + String(i),
                                 desc: "Description numéro " + String(i),  categories: []  ))
        }
        
        categoryList.append(Category(name: "Category 1", state: true))
        categoryList.append(Category(name: "Category 2", state: true))
        categoryList.append(Category(name: "Category 3", state: true))
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
            let section = indexPath.section
            todo[section].remove(at: row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! DetailsViewController
            let myIndexPath = myTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            let section = myIndexPath.section
            detailsViewController.todo = todo[section][row]
            
        }
        if segue.identifier == "add" {
            let createTaskViewController = segue.destination as! CreateTaskView
            createTaskViewController.categoryList = categoryList
            
        }
    }
   
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let TaskView = unwindSegue.source as! CreateTaskView
        if unwindSegue.identifier == "cancel" {
            TaskView.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save" {
            
            // get the current date and time
            let currentDateTime = Date()
            // get the user's calendar
            let userCalendar = Calendar.current
            // choose which date and time components are needed
            let requestedComponents: Set<Calendar.Component> = [
                .weekOfYear,
                .year,
                .month,
                .day,
                .hour,
                .minute,
                .second
            ]
                
            // get the components
            let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
            // get the components from UI
            let dateRes = userCalendar.dateComponents(requestedComponents, from: TaskView.myDate.date)
            
            var i = 0
            if(dateTimeComponents.year != dateRes.year || dateTimeComponents.month != dateRes.month || dateTimeComponents.weekOfYear != dateRes.weekOfYear){ //other
                i = 3
            }else if(dateTimeComponents.day == dateRes.day){ //today
                i = 0
            }else if ((dateTimeComponents.day! + 1) == dateRes.day){//tomorrow
                i = 1
            }else if(dateTimeComponents.weekOfYear == dateRes.weekOfYear){//this week
                i = 2
            }
            
            if let myTitle = TaskView.myTitle.text, let myDescription = TaskView.myDesc.text {
                let  categories = TaskView.categories

                let new_data = Todo(nom: myTitle,desc: myDescription, categories: categories)
                
                todo[i].append(new_data)
                myTableView.reloadData()
                }
            }
        
        
        }

}
