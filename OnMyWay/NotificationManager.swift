//
//  NotificationManager.swift
//  OnMyWay
//
//  Created by Antonio Bello on 11/15/14.
//  Copyright (c) 2014 Ubersimple. All rights reserved.
//

import Foundation
import CloudKit

func keyConverter(key: String) -> AnyObject {
    return CKReference(recordID: CKRecordID(recordName: key), action: CKReferenceAction.None)
}

class NotificationManager {
    private let container = CKContainer.defaultContainer()
    private let fromUserID = "_7916ae5e744cd989963af0dd371a2380"
    private let toUserID = "_5cb116bb37f9e8784981f4ca617f816c"

    func sendNotification(type: NotificationType, message: String?) {
        var notification = Notification(fromUserID: self.fromUserID, toUserID: self.toUserID, type: type, message: message)
        var notificationRecord = CKRecord(recordType: Notification.entityName)
        notificationRecord.setValuesForKeysWithDictionary(notification.toDict(keyConverter))
        self.container.publicCloudDatabase.saveRecord(notificationRecord) { (record, error) in
        }
    }
    
    
}