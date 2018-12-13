//
//  BidStorage.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 06/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BidStorage {
    
    let db:Firestore
    var listeners=[ListenerRegistration]()
    init() {
        db = Firestore.firestore()
    }
    
    func getBids(article:Article , listener: BidStorageProtocol) {
        let listener = db.collection("Articles").document(article.id).collection("Bids").addSnapshotListener { querySnapshot, err in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching document")
                return
            }
            listener.setDocuments(article: article, documents: documents)
        }
        listeners.append(listener)
       
    }
    
    func addBid(article:Article, bid:Bid) {
        
        db.collection("Articles").document(article.id).collection("Bids").addDocument(data: [
            "bid" : bid.bid,
            "date" : bid.date,
            "memberId" : bid.memberId])
        {
            err in if let error = err {
                print(error.localizedDescription)
            }
        }
    }
    
    func close() {
        for var listener in listeners {
            listener.remove()
        }
    }
}
