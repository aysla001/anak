//
//  Constants.swift
//  anak
//
//  Created by Angel Ysla on 9/2/20.
//  Copyright © 2020 The Aquarium. All rights reserved.
//

struct K {
    
    static let appName = "Anak"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "TopicCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

