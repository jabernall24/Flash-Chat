//
//  Message.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import Foundation

class Message {
    var user: String?
    var message: String?
    
    init(dictionary: [String: String]) {
        var dictionary = dictionary
        user = dictionary["User"]
        message = dictionary["MessageBody"]
    }
    
    static func messages(with array: [[String: String]]) -> [Message] {
        var messages: [Message] = []
        
        for messageDictionary in array{
            let message = Message(dictionary: messageDictionary)
            messages.append(message)
        }
        return messages
    }
    
}
