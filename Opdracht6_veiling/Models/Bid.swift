//
//  Bid.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class Bid {
    
    var id: String
    var bid: Double
    var date: Date
    var memberId: String
    
    init(id: String, bid: Double, date: Date, memberId: String) {
        self.id = id
        self.bid = bid
        self.date = date
        self.memberId = memberId
    }
    
    func getId() -> String {
        return id
    }
    
    func getBid() -> Double {
        return bid
    }
    
    func getDate() -> Date {
        return date
    }
    
    func getMemberId() -> String {
        return memberId
    }
    
    func setId(id:String) {
        self.id = id
    }
    
    func setBid(bid:Double) {
        self.bid = bid
    }
    
    func setDate(date:Date) {
        self.date = date
    }
    
    func setMemberId(memberId:String){
        self.memberId = memberId
    }
}
