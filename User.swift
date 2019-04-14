//
//  User.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/13/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
