//
//  Answer.swift
//  anak
//
//  Created by Angel Ysla on 7/27/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

import Foundation
import RealmSwift

class Topic: Object {
    @objc dynamic var name:  String = ""
    @objc dynamic var colour: String = ""
    let questions = List<Question>()

}
