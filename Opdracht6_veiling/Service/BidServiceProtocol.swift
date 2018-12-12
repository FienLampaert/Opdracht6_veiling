//
//  BidServiceProtocol.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 06/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

protocol BidServiceProtocol {
    func setBids(article: Article, bids:[Bid])
}
