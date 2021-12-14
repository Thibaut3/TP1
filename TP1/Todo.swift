//
//  Todo.swift
//  TP1
//
//  Created by Thibaut Juillard on 08/12/2021.
//

import Foundation

class Todo{
    
    var nom = ""
    var desc = ""
    var categories = [Category]()
    init(nom : String, desc : String, categories: [Category]){
        self.nom = nom
        self.desc = desc
        self.categories = categories
    }
}
