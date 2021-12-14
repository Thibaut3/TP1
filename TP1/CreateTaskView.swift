//
//  CreateTaskView.swift
//  TP1
//
//  Created by Thomas Miramon on 08/12/2021.
//

import Foundation
import UIKit

class CreateTaskView: UIViewController {

    @IBOutlet weak var myTitle: UITextView!
    @IBOutlet weak var myDesc: UITextView!
    @IBOutlet weak var myDate: UIDatePicker!
    var categories: [Category] = []
    var categoryList = [Category] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTitle.layer.borderColor = UIColor.lightGray.cgColor
        self.myTitle.layer.borderWidth = 1
        
        self.myDesc.layer.borderColor = UIColor.lightGray.cgColor
        self.myDesc.layer.borderWidth = 1
        
        myDate.minimumDate = Date()
    }
    
    @IBAction func unwindToTaskView(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! SelectCategoryView
        
        if unwindSegue.identifier == "addCategory" {
            categories = sourceViewController.category
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCategory" {
            let vc = segue.destination as! SelectCategoryView
            vc.categoryList = categoryList
        }
    }
}
//
// myTableView.reloadData()
