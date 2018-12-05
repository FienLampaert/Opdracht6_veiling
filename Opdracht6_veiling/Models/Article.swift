//
//  Article.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class Article {
    
    var id:String
    var description:String
    var minBid:Float
    var bids: [Bid]
    
    init(id:String, description:String, minBid:Float, bids:[Bid]?) {
        self.id = id
        self.description = description
        self.minBid = minBid
        if var b = bids {
            self.bids = b
        } else {
            self.bids = []
        }
    }
    
    func getId() -> String {
        return id
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getMinBid() -> Float {
        return minBid
    }
    
    func getBids() -> [Bid] {
        return bids
    }
    
    func setId(id:String) {
        self.id = id
    }
    
    func setDescription(description:String) {
        self.description = description
    }
    
    func setBids(bids:[Bid]){
        self.bids = bids
    }
    
    func addBid(bid:Bid){
        bids.append(bid)
    }
}
