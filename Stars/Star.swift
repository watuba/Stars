//
//  Star.swift
//  Stars
//
//  Created by Ben Haun on 11/27/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

struct Star {

    let content:String!
    //let userScore:Int!
    //let color:UIColor!
    let addedByUser:String!
    let key:String!
    let itemRef:FIRDatabaseReference?
    
    
    
    init(content:String, addedByUser:String, key:String = "") {
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init (snapshot: FIRDataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        if let starContent = snapshotValue!["content"] as? String {
            content = starContent
        } else {
            content = ""
        }
        
        if let starUser = snapshotValue!["addedByUser"] as? String {
            addedByUser = starUser
        } else {
            addedByUser = ""
        }
    }

    func toAnyObject() -> AnyObject {
        return ["content":content, "addedbyUser":addedByUser] as AnyObject
    }
}
