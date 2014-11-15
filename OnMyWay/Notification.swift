//
//  Notification.swift
//  OnMyWay
//
//  Created by Antonio Bello on 11/15/14.
//  Copyright (c) 2014 Ubersimple. All rights reserved.
//

import Foundation

typealias KeyConverter = (String) -> (AnyObject)

enum NotificationType : Int {
    case OnMyWay = 1
}

protocol Cloudable {
    class var entityName: String { get }
    func toDict(keyConverter: KeyConverter) -> [String : AnyObject]
}

class Notification {
    var fromUserID: String
    var toUserID: String
    var message: String?
    var type: NotificationType
    
    init(fromUserID: String, toUserID: String, type: NotificationType, message: String?) {
        self.fromUserID = fromUserID
        self.toUserID = toUserID
        self.type = type
        self.message = message
    }
}

extension Notification: Cloudable {
    class var entityName: String { return "notification" }
    
    func toDict(keyConverter: KeyConverter) -> [String : AnyObject] {
        var dict = [String : AnyObject]()
        dict["fromUser"] = keyConverter(self.fromUserID)
        dict["toUser"] = keyConverter(self.toUserID)
        dict["type"] = self.type.rawValue
        dict["message"] = self.message
        
        return dict
    }
}