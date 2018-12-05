//
//  ArticleService.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

class ArticleService {
    
    let articleStorage:ArticleStorage
    
    init() {
        articleStorage = ArticleStorage()
    }
    
    func getAll() -> [Article] {
        var documents = articleStorage.getAll();
        var articles:[Article] = []
        
        for document in documents {
            let number:CFNumber = document.data()["minBid"] as! CFNumber
            
            let a = Article(id: document.documentID, description: document.data()["description"] as! String, minBid: floatToDouble(number: number), bids: nil)
            
            articles.append(a)
        }
        return articles
    }
    
    func floatToDouble(number:CFNumber) -> Double {
        var bidFloat:Float = 0
        if CFNumberGetValue(number, CFNumberType.floatType, &bidFloat) {
            return Double(bidFloat)
        } else {
            return 0
        }
    }
}
