//
//  User.swift
//  ChatProject
//
//  Created by Alexander Lovato on 6/18/16.
//  Copyright © 2016 Nonsense Inc. All rights reserved.
//

import Foundation
import Firebase

struct User: FirebaseType {
    
    //MARK: Constants
    
    private static let kUsername = "username"
    
    //MARK: Properties
    
    var username: String
    
    //MARK: Firebase Type
    
    var identifier: String?
    var endpoint: String {
        return "Users"
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        jsonRepresentation = [User.kUsername : username]
        
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let username = dictionary[User.kUsername] as? String else { return nil }
        
        self.init(username: username)
        
        self.identifier = identifier
    }
    
    //MARK: Initializers
    
    init(username: String) {
        self.username = username
    }
    
    
    //MARK: Other Methods
    
}