//
//  ViewController.swift
//  Todo
//
//  Created by 野崎陽奈子 on 2019/09/23.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var todoTextField: UITextField!
    
    var todoArray:[String] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey: "task") != nil {
            todoArray = saveData.array(forKey: "task") as! [String]
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func save() {
        todoArray.append(todoTextField.text!)
        saveData.set(todoArray, forKey: "task")
        
        todoTextField.text = ""
    }
    
}

