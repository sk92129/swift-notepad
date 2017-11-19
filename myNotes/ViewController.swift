//
//  ViewController.swift
//  myNotes
//
//  Created by Sean Kang on 11/18/17.
//  Copyright © 2017 ceg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var data: [String] = ["Row 1", "Row 2", "Row 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "My Notes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        self.navigationItem.rightBarButtonItem = addButton
        
        // this editButtonItem is built into the tableview
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @objc func addNote() {
        let name:String = "Row \(data.count + 1)"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row:0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Best practice for using TableView Cell
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if (editing) {
            NSLog("editing")
            // if this calls the parent setEditing then this gets called indefinitely.
            // but if I dont call it, then the edit button does not change to "done"
        } else {
            NSLog("not Editing ")
            self.setEditing(editing, animated: animated)
        }
        
        table.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

