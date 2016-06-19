//
//  Groups.swift
//  ChatProject
//
//  Created by Alexander Lovato on 6/19/16.
//  Copyright © 2016 Nonsense Inc. All rights reserved.
//

import Foundation
import Firebase

struct Groups: FirebaseType {
    
    //MARK: Constants
    
    static private let kTitle = "title"
    static private let kDateCreated = "dateCreated"
    static private let kUserIds = "userIDs"
    
    //MARK: Properties
    
    let title: String
    let dateCreated: NSDate
    var userIDs: [String]
    
    
    
    //MARK: Firebase Type
    
    var identifier: String?
    var endpoint: String {
        return "groups"
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        jsonRepresentation = [Groups.kTitle : title, Groups.kDateCreated : dateCreated, Groups.kUserIds : userIDs]
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let title = dictionary[Groups.kTitle] as? String, dateCreated = dictionary[Groups.kDateCreated] as? NSDate else {return nil}
        
        let userIdDictionary = dictionary[Groups.kUserIds] as? [String : AnyObject]
        let userIDs = userIdDictionary?.flatMap({String(dictionary: $0.1 as! [String : AnyObject], identifier: $0.0)}) ?? []
        
        self.init(title : title, dateCreated: dateCreated, userIDs: userIDs)
        
        self.identifier = identifier
    }
    
    //MARK: Initializers
    
    init(title: String, dateCreated: NSDate = NSDate(), userIDs: [String] = []) {
        self.title = title
        self.dateCreated = dateCreated
        self.userIDs = userIDs
    }
    
    
    //MARK: Other Methods
    
    
}