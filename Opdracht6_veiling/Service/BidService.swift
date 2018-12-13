//
//  BidService.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 06/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BidService: BidStorageProtocol {
    
    var listener:BidServiceProtocol?
    let bidStorage:BidStorage
    
    init() {
        bidStorage = BidStorage()
    }
    
    func getBids(article:Article, listener: BidServiceProtocol)  {
        bidStorage.getBids(article: article, listener: self)
        self.listener = listener
        
    }
    
    func setDocuments(article: Article, documents: [QueryDocumentSnapshot]) {
        var bids:[Bid] = []
        
        for document in documents {
            let number:CFNumber = document.data()["bid"] as! CFNumber
            
            let bid:Bid = Bid(id: document.documentID, bid: floatToDouble(number: number), date: document.data()["date"] as! Date, memberId: document.data()["memberId"] as! String)
            
            bids.append(bid)
        }
        listener?.setBids(article: article ,bids: bids)
    }
    
    func floatToDouble(number:CFNumber) -> Double {
        var bidFloat:Float = 0
        if CFNumberGetValue(number, CFNumberType.floatType, &bidFloat) {
            return Double(bidFloat)
        } else {
            return 0
        }
    }
    
    func close() {
        bidStorage.close()
    }
    
    func addBid(article:Article, bid:Bid) {
        bidStorage.addBid(article: article, bid: bid)
    }
}
