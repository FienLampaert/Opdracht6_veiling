//
//  MemberStorage.swift
//  Opdracht6_veiling
//
//  Created by student on 13/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

class MemberStorage {
    
    let db:Firestore
    var listeners=[ListenerRegistration]()
    init() {
        db = Firestore.firestore()
    }
    
    func getMember(login:Login, listener:MemberStorageProtocol) {
        db.collection("Members").whereField("uId", isEqualTo: login.uId).getDocuments{ (querySnapshot, err) in
            var documentArray=[QueryDocumentSnapshot]()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    documentArray.append(document)
                }
                listener.setMember(documents: documentArray)
            }
        }
        
    }
}
