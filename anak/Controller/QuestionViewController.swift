//
//  QuestionViewController.swift
//  anak
//
//  Created by Angel Ysla on 8/29/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class QuestionViewController: UITableViewController {
    
    // array of questions
    var questions: Results<Question>?
    let realm = try! Realm()
    
    //outlet to search bar could go here
    
    var selectedTopic : Topic? {
        didSet{
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }
    
    //func viewWillAppear in todoey ths looks like how we selected the title = selectedCategory !.name and and navbar controls?

    @IBAction func addQuestionButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Question", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            if let currentTopic = self.selectedTopic{
                do {
                    try self.realm.write{
                            let newQuestion = Question()
                            newQuestion.title = textField.text!
                            currentTopic.questions.append(newQuestion)
                            //self.save(question: newQuestion)
                    }
                } catch {
                    print ("Error saving new questions, \(error)")
                }
            }
            
            self.tableView.reloadData()
            
        }
    
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new question"
            textField = alertTextField
        }
        alert.addAction(action)
        present (alert, animated: true, completion: nil)
        

        
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = self.tableView(tableView, cellForRowAt: indexPath)
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Question Cell", for: indexPath)
        
        if let question = questions?[indexPath.row] {
            cell.textLabel?.text = question.title
        } else {
            cell.textLabel?.text = "No items Added"
        }
        
        return cell
        
        
    }

//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//

    //MARK: - Add new items
    //not sure we actually use this save function
    func save(question: Question) {
         do {
             try realm.write {
                 realm.add(question)
             }
         } catch {
             print ("Error saving question \(error)")
         }
        
         tableView.reloadData()
    }
    
    func loadItems() {
        questions = selectedTopic?.questions.sorted(byKeyPath: "title", ascending: true)
    }
    
    //override func updateModel
    //what was this in the ToDoey for?
    
}

