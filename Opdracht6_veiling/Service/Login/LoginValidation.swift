//
//  LoginValidation.swift
//  Opdracht6_veiling
//
//  Created by student on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginValidation{
    
    static func validate (email:String, password:String, listener:LoginValidationProtocol) {
        var validationOK = true
        var err:String
        
        if(validationOK == true) {
            signIn(email: email, password: password, listener: listener)
        }
    }
    
    static func checkEmptyFields(email:String, password:String) -> String {
        
        if(email.isEmpty) {
            return "Email is empty"
        }
        
        if(password.isEmpty) {
            return "Password is empty"
        }
        
        return ""
    }
    
    static func signIn(email:String, password: String, listener:LoginValidationProtocol) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if(error != nil) {
                listener.loginCompleted(login: nil, error: error?.localizedDescription)
            }
            if(user != nil) {
                let login:Login = Login(email: email, password: password)
                listener.loginCompleted(login: login, error: nil)
            }
        }
    }
}
