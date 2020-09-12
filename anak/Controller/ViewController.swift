//
//  ViewController.swift
//  anak
//
//  Created by Angel Ysla on 4/15/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class ViewController: UIViewController {
    
    let realm = try!Realm()
    
    var topics: Results<Topic>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loadTopics()

    }

@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
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
    
    //MARK: - Data Manipulation Methods
    
    func save (topic: Topic) {
        do {
            try realm.write {
                realm.add(topic)
            }
        } catch {
            print ("Error saving topic \(error)")
        }
        loadTopics()
    }
    
    func loadTopics (){
        topics = realm.objects(Topic.self)
    }
    
    

    @IBAction func UIViewControllerButtonPressed(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "UIViewControllerSegue", sender: self)
    }
    
    @IBAction func UITableViewControllerPressed(_ sender: UIButton) {
         self.performSegue(withIdentifier: "UITableViewControllerSegue", sender: self)

    }
    
}



extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print (searchBar.text!)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

