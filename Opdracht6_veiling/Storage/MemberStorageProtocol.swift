//
//  MemberStorageProtocol.swift
//  Opdracht6_veiling
//
//  Created by student on 13/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol MemberStorageProtocol {
    func setMember(documents: [QueryDocumentSnapshot])
}
