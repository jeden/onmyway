//
//  CKRecordID+Helpers.swift
//  OnMyWay
//
//  Created by Antonio Bello on 11/15/14.
//  Copyright (c) 2014 Ubersimple. All rights reserved.
//

import Foundation
import CloudKit

extension CKRecordID {
    func toString() -> String {
        return self.zoneID != nil ?
            "\(self.recordName):\(self.zoneID.zoneName):\(self.zoneID.ownerName)" :
            self.recordName
    }
    
    class func fromString(string: String) -> CKRecordID? {
        let components = string.componentsSeparatedByString(":")
        var recordZoneID: CKRecordZoneID
        var recordID: CKRecordID?
        
        switch (components.count) {
        case 1:
            recordID = CKRecordID(recordName: components[0])
            
        case 3:
            let recordZoneID = CKRecordZoneID(zoneName: components[1], ownerName: components[2])
            recordID = CKRecordID(recordName: components[0], zoneID: recordZoneID)
            
        default:
            recordID = nil
        }
        
        return recordID
    }
}