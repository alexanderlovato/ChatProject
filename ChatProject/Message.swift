//
//  Message.swift
//  ChatProject
//
//  Created by Alexander Lovato on 6/15/16.
//  Copyright © 2016 Nonsense Inc. All rights reserved.
//

import Foundation
import Firebase

class Message: FirebaseType {
    
    //MARK: Constants
    private static let kText = "text"
    private static let kTimestamp = "timestamp"
    private static let kGroupIdentifier = "groupIdentifier"
    private static let kSenderID = "senderID"
    
    //MARK: Properties
    let text: String
    let timeStamp: NSDate
    let groupIdentifier: String
    let senderID: String
    
    
    //MARK: Firebase Type
    var identifier: String?
    var endpoint: String {
        return "messages"
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        
        jsonRepresentation = [Message.kText : text, Message.kTimestamp : timeStamp, Message.kGroupIdentifier : groupIdentifier, Message.kSenderID : senderID]
        
        return jsonRepresentation
    }
    
    required convenience init?(dictionary: [String : AnyObject], identifier: String) {
        guard let text = dictionary[Message.kText] as? String, timeStamp = dictionary[Message.kTimestamp] as? NSDate, groupIdentifier = dictionary[Message.kGroupIdentifier] as? String, senderID = dictionary[Message.kSenderID] as? String else { return nil }
        
        self.init(text: text, timeStamp: timeStamp, groupIdentifier: groupIdentifier, senderID: senderID)
        self.identifier = identifier
    }
    
    
    //MARK: Initializers
    
    init(text: String, timeStamp: NSDate = NSDate(), groupIdentifier: String, senderID: String) {
        
        self.text = text
        self.timeStamp = timeStamp
        self.groupIdentifier = groupIdentifier
        self.senderID = senderID
    }
    
    
    //MARK: Other Methods
    
}