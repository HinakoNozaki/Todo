//
//  ViewController.swift
//  Todo
//
//  Created by 野崎陽奈子 on 2019/09/23.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var todoTextField: UITextField!
    
    var todoArray:[String] = []
    var before:String = ""
    
    let saveData = UserDefaults.standard
    let editor = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if editor.string(forKey: "change") != nil {
            todoTextField.text = editor.string(forKey: "change")
            editor.removeObject(forKey: "change")
        }
        if saveData.array(forKey: "task") != nil {
            todoArray = saveData.array(forKey: "task") as! [String]
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        let inputWord = todoTextField.text!
        
        if editor.string(forKey: "number") != nil {
            var num: Int = editor.integer(forKey: "number")
            todoArray[num] = inputWord
            editor.removeObject(forKey: "number")
        }else {
        todoArray.append(todoTextField.text!)
        }
        saveData.set(todoArray, forKey: "task")
        
        todoTextField.text = ""
        
        //self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
 
    }
    
}

