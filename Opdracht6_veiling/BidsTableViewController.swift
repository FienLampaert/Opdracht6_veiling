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
    let login:Login()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        //getBidsOfArticle()
    }

    func setContent(login:Login) {
        self.login = login
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        let article = articles[indexPath.row]
        cell.cellTitle?.text = article.description
        
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
            bidService.getBids(article: article, listener: self)
        }
    }
    
    func setAllArticles(articles: [Article]) {
        self.articles = articles
        self.tableView.reloadData()
        getBidsOfArticle()
    }
    
    func setBids(article: Article, bids: [Bid]) {
        print(article.getBids().count)
        article.setBids(bids: bids)
        let row = self.articles.firstIndex { (art) -> Bool in
            return art.id == article.id
        }
        let indexPath:IndexPath = IndexPath(row: row ?? 0, section: 0)
        let indexPaths: [IndexPath] = [indexPath]
        self.tableView.reloadRows(at: indexPaths, with: UITableView.RowAnimation.left)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        bidService.close()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"vcDetail") as! DetailViewController
        vc.setContent(article:articles[indexPath.row], login:self.login)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
