//
//  TopicController.swift
//  anak
//
//  Created by Angel Ysla on 8/2/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

//todoey uses UITableViewController
class TopicController: UITableViewController {
    
    let realm = try!Realm()
    
    var topics: Results<Topic>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTopics()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Topic", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newTopic = Topic()
            newTopic.name = textField.text!
            newTopic.colour = UIColor.randomFlat().hexValue()
            print (textField.text)
            
            //we don't need to append anymore the database just updates
            //self.categories.append(newCategory)
            
            self.save(topic: newTopic)
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new topic"
        }
        present(alert,animated: true, completion: nil)
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numoftopics = topics?.count ?? 1
        print ("Number of topics \(numoftopics)")
        return topics?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //let cell = super.tableView(tableView, cellForRowAt: indexPath)

        // broken line we need to come back to if we want to impliment similar to FlashChat
            self.tableView.register(UINib(nibName: "TopicCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        //tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TopicCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
//            as! MessageCell
//        cell.label.text = message.body


            if let topic = topics?[indexPath.row]{
                //cell.textLabel?.text = "Sample"
                cell.textLabel?.text = topic.name
                 
                //guard let categoryColour = UIColor(hexString: category.colour) else {fatalError()}
                //cell.backgroundColor = categoryColour
                //cell.textLabel?.textColor = ContrastColorOf(categoryColour, returnFlat: true)
            }

    //        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added"
    //
    //        cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].colour ?? "1D9BF6")

            return cell

    }
    //MARK: - Data Manipulation Methods
    
    func save (topic: Topic) {
        do {
            try realm.write {
                realm.add(topic)
            }
        } catch {
            print ("Error saving topic \(error)")
        }
       
        tableView.reloadData()
    }
    
    func loadTopics (){
        topics = realm.objects(Topic.self)
    }
    
    
    @IBAction func ViewTopicsPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ViewTopics", sender: self)
    }
    
}

