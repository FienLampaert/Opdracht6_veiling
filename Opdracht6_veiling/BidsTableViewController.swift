//
//  BidsTableViewController.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class BidsTableViewController: UITableViewController, ArticleServiceProtocol, BidServiceProtocol {
    
    
    var articles = [Article]()
    let articleService = ArticleService()
    let bidService = BidService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        getBidsOfArticle()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        print("ja")
        let article = articles[indexPath.row]
        cell.cellTitle?.text = article.description
        print(article.description)
        print(articles.count)
        
        if(article.bids.count == 0) {
            cell.cellSubTitle?.text = "Startbedrag: " + String(article.minBid)
        } else {
            var highestBid:Double = 0
            for var bid in article.bids {
                if(highestBid < bid.bid) {
                    highestBid = bid.bid
                }
            }
            cell.cellSubTitle?.text = "Hoogste bod: " + String(highestBid)
        }
        

        return cell
    }
    
    func getData() {
        articleService.getAll(listener:self)
    }
    
    func getBidsOfArticle() {
        for article in articles {
            bidService.getBid(article: article, listener: self)
        }
    }
    
    func setAllArticles(articles: [Article]) {
        self.articles = articles
        self.tableView.reloadData()
    }
    
    func setBid(article: Article, bid: Bid) {
        self.tableView.reloadRows(at: indexPaths, with: UITableView.RowAnimation.left)
    }
}
