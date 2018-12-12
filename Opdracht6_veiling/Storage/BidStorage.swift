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
    
    init() {
        db = Firestore.firestore()
    }
    
    func getBids(article:Article , listener: BidStorageProtocol) {
        db.collection("Articles").document(article.id).collection("Bids").addSnapshotListener { querySnapshot, err in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching document")
                return
            }
            listener.setDocuments(article: article, documents: documents)
        }
        
    }
    
}
