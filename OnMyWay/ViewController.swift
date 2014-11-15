//
//  ViewController.swift
//  OnMyWay
//
//  Created by Antonio Bello on 11/15/14.
//  Copyright (c) 2014 Ubersimple. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    let notificationManager = NotificationManager()
    let container = CKContainer.defaultContainer()

    @IBOutlet weak var btnOnMyWay: UIButton!
}


// MARK: - Lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maybeAskForPermission()
    }
}

// MARK: - Event Handlers
extension ViewController {
    @IBAction func didTapOnMyWay() {
        sendNotification()
        //discover()
    }
}

// MARK:- Internals
extension ViewController {
    private func maybeAskForPermission() {
        container.requestApplicationPermission(.PermissionUserDiscoverability) { (status, error) in
            println("Status is \(status.rawValue)")
        }
    }
    
    private func sendNotification() {
        self.notificationManager.sendNotification(.OnMyWay, message: nil)
        
//        var notification = CKRecord(recordType: "notification");
//        notification.setValue(NotificationType.OnMyWay.rawValue, forKey: "type")
//        notification.setValue("Test message", forKey: "message")
//        
//        self.container.publicCloudDatabase.saveRecord(notification) { (record, error) in
//            println(error)
//        }
    }
    
    private func discover() {
        self.container.discoverAllContactUserInfosWithCompletionHandler { users, error in
            println(users)
        }
//        self.container.discoverUserInfoWithEmailAddress("magdalena@elapsus.com") { users, error in
//            println(users)
//        }
        
//        self.container.publicCloudDatabase.
//        let discovered = self.container.publicCloudDatabase CKDiscoverAllContactsOperation.
    }
    
}