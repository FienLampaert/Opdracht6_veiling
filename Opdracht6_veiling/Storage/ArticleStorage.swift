//
//  ArticleStorage.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ArticleStorage {
    
    let db:Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    func getAll(listener: ArticleStorageProtocol) {
        db.collection("Articles").getDocuments() { (querySnapShot, err) in
            var documentArray:[QueryDocumentSnapshot] = []
            if let err = err {
                print("error")
            } else {
                for document in querySnapShot!.documents {
                    documentArray.append(document)
                }
                listener.setAllDocuments(documents: documentArray)
            }            
        }
        
    }
    
}
