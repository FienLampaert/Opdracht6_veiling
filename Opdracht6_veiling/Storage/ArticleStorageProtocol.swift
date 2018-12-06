//
//  ArticleStorageProtocol.swift
//  Opdracht6_veiling
//
//  Created by student on 06/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol ArticleStorageProtocol {
    func setAllDocuments(documents: [QueryDocumentSnapshot])
}
