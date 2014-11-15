//
//  User.swift
//  OnMyWay
//
//  Created by Antonio Bello on 11/15/14.
//  Copyright (c) 2014 Ubersimple. All rights reserved.
//

import Foundation
import CloudKit

class User {
    var firstName: String
    var lastName: String
    var id: String
    
    init(user: CKDiscoveredUserInfo) {
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.id = user.userRecordID.toString()
    }
}