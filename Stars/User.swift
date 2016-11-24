//
//  User.swift
//  Stars
//
//  Created by Ben Haun on 11/23/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    let uid: String
    let email: String
    
    init(userData: FIRUser) {
        uid = userData.uid
        
        if let mail = userData.providerData.first?.email {
            email = mail
        } else {
            email = ""
        }

    }
    
    init (uid: String, email: String, userName: String) {
        self.uid = uid
        self.email = email
    }
}
