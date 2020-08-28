//
//  Question.swift
//  anak
//
//  Created by Angel Ysla on 7/27/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Topic.self, property: "questions")
}
