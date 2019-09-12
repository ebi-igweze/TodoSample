//
//  ViewController.swift
//  TodoSample
//
//  Created by ebi igweze on 12/09/2019.
//  Copyright © 2019 ebi igweze. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var todoTableView: UITableView!
    
    // todo list
    var todos: [String]  = [
      "Get new Yhandi Album",
      "Get Veggies",
      "Deploy all services",
      "Take grandma for dinner",
    ];

    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 80
    }
    
    
    @IBAction func addTodo(_ sender: Any) {
        let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new Todo", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = todoAlert.textFields![0]
            self.todos.append(newTodo.text!)
            self.todoTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        // attach actions for submition and cancellation
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        // present the alert
        present(todoAlert, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
        
        // set the title of the current index
        cell.todoTitle.text = todos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell
        
        // if checked, uncheck else check
        if cell.isChecked == true {
            cell.todoCheckIcon.image = nil
            cell.isChecked = false
        } else {
            cell.todoCheckIcon.image = UIImage(named: "check.png")
            cell.isChecked = true
        }
    }
    
    // override interaction to remove item from row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // when item is deleted, remove item
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            todoTableView.reloadData()
        }
    }
    

}

