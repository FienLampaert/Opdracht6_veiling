//
//  BidStorageProtocol.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 06/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol BidStorageProtocol {
    func setDocuments(article:Article, documents: [QueryDocumentSnapshot])
}
