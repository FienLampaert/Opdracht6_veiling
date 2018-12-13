//
//  MemberService.swift
//  Opdracht6_veiling
//
//  Created by student on 13/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

class MemberService: MemberStorageProtocol {
    
    var listener:MemberServiceProtocol?
    let memberStorage:MemberStorage
    
    init() {
        memberStorage = MemberStorage()
    }
    
    func getMember(login:Login, listener: MemberServiceProtocol)  {
        memberStorage.getMember(login: login, listener: self)
        self.listener = listener
        
    }
    
    func floatToDouble(number:CFNumber) -> Double {
        var bidFloat:Float = 0
        if CFNumberGetValue(number, CFNumberType.floatType, &bidFloat) {
            return Double(bidFloat)
        } else {
            return 0
        }
    }
    
    func setMember(documents: [QueryDocumentSnapshot]) {
        var members:[Member] = []
        
        for document in documents {
            let member:Member = Member(id: document.documentID, name: document.data()["name"] as! String, birthDate: document.data()["birthDate"] as! Date, uId: document.data()["uId"] as! String)
            
            members.append(member)
        }
        listener?.setMember(member: members)
    }
}
