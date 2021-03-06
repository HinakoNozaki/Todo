//
//  TodoTableViewController.swift
//  Todo
//
//  Created by 野崎陽奈子 on 2019/09/28.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todoArray:[String] = []
    var selectedText:String?
    
    let saveData = UserDefaults.standard
    let editor = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "task") != nil {
            todoArray = saveData.array(forKey: "task") as! [String]
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTableViewCell
        
        let nowIndexPathDictionary = todoArray[indexPath.row]
        
        cell.todoLabel.text = nowIndexPathDictionary
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData.set(todoArray, forKey: "task")
        }
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedText = todoArray[indexPath.row]
    //print("\(indexPath.row)番のセルを選択しました！ ")
    //print("\(todoArray[indexPath.row])を選択しました！ ")
    
    let word = todoArray[indexPath.row]
    let num = indexPath.row
    editor.set(word, forKey: "change")
    editor.set(num, forKey: "number")
    performSegue(withIdentifier: "edit", sender: nil)
   }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if (segue.identifier == "edit") {
                   //let secondVC: ViewController = (segue.destination as? ViewController)!
       //secondVC.text = selectedText!
                let nextView = (segue.destination as! ViewController)?
                nextView.before = selectedText
                //nextView.todoTextField.text = selectedText
               }
           }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
