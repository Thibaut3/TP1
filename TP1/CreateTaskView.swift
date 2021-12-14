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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTitle.layer.borderColor = UIColor.lightGray.cgColor
        self.myTitle.layer.borderWidth = 1
        
        self.myDesc.layer.borderColor = UIColor.lightGray.cgColor
        self.myDesc.layer.borderWidth = 1
        
        myDate.minimumDate = Date()
    }
}
//
// myTableView.reloadData()
