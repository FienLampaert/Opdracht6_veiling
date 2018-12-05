//
//  Member.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class Member {
    
    var id: String
    var name: String
    var birthDate: Date
    var uId: String
    
    init(id:String, name:String, birthDate:Date, uId:String){
        self.id = id
        self.name = name
        self.birthDate = birthDate
        self.uId = uId
    }
    
    func getId() -> String {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func getBirthDate() -> Date {
        return birthDate
    }
    
    func getUId() -> String {
        return uId
    }
    
    func setId(id:String) {
        self.id = id
    }
    
    func setName(name:String) {
        self.name = name
    }
    
    func setBirthDate(birthDate:Date){
        self.birthDate = birthDate
    }
    
    func setUId(uId:String){
        self.uId = uId
    }
}
