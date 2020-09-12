//
//  TopicsTableViewController.swift
//  anak
//
//  Created by Angel Ysla on 8/11/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class TopicsUIViewController: UIViewController {
    
    let realm = try!Realm()

    //    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var topics: Results<Topic>?
    //var topics: [Topic] = []

    override func viewDidLoad() {
        debugPrint("viewDidLoad-1")
        super.viewDidLoad()
        debugPrint("viewDidLoad-2")
        tableView.dataSource = self
        debugPrint("viewDidLoad-3")
        
        title = K.appName
        
        debugPrint("viewDidLoad-4")
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        debugPrint("viewDidLoad-5")
        loadTopics()
        debugPrint("viewDidLoad-6")
    }
    
    func loadTopics() {
        topics = realm.objects(Topic.self)
        debugPrint("loadTopics")
    }
    
}

// MARK: extension for UITableViewDataSource
extension TopicsUIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("tableView numberOfRowsInSection")
        return topics?.count ?? 1

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // name of reusable cell name
        let topic = topics?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! TopicCell
        
        cell.label.text = topic?.name
        
        debugPrint("tableView cellForRowAt")
        return cell
    }


    
}
