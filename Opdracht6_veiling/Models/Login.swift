//
//  Login.swift
//  Opdracht6_veiling
//
//  Created by student on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class Login {
    
    var email: String
    var password: String
    
    init(email:String, password:String) {
        self.email = email
        self.password = password
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getPassword() -> String {
        return password
    }
}
