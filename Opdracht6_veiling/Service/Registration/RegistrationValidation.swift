//
//  RegistrationValidation.swift
//  Opdracht6_veiling
//
//  Created by student on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseAuth

class RegistrationValidation{
    
    static func validate (name: String, email:String, password:String, passwordValidation:String, birthDate:Date, listener:RegistrationValidationProtocol) {
        var validationOK = true
        
        if(!(checkPasswords(password: password, passwordValidation: passwordValidation))) {
            validationOK = false
            let err = "Passwords don't match"
            listener.registrationCompleted(login: nil, error: err)
        }
        
        if(validationOK == true) {
            createUser(email: email, password: password, listener: listener)
        }
    }
    
    static func checkEmptyFields(name: String, email:String, password:String, passwordValidation:String) -> String {
        
        if(name.isEmpty) {
            return "Name is empty"
        }
        
        if(email.isEmpty) {
            return "Email is empty"
        }
        
        if(password.isEmpty) {
            return "Password is empty"
        }
        
        if(passwordValidation.isEmpty) {
            return "Repeat is empty"
        }
        
        return ""
    }
    
    
    static func checkPasswords(password:String, passwordValidation:String) -> Bool {
        if(password == passwordValidation) {
            return true
        }
        return false
    }
    
    static func createUser(email: String, password: String, listener: RegistrationValidationProtocol){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            //print("error " + error.debugDescription)
            if(error != nil) {
                listener.registrationCompleted(login: nil, error: error?.localizedDescription)
            }
            if(authResult != nil) {
                let login:Login = Login(email: email, password: password)
                listener.registrationCompleted(login: login, error: nil)
            }
            //print("authResult " + authResult.debugDescription)
            guard let user = authResult?.user else { return }
        }
    }
}

