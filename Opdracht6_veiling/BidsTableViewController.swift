//
//  BidsTableViewController.swift
//  Opdracht6_veiling
//
//  Created by Margot Vandenberghe on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class BidsTableViewController: UITableViewController, ArticleServiceProtocol {
    
    var articles = [Article]()
    let articleService = ArticleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        cell.textLabel?.text = articles[indexPath.row].description

        return cell
    }
    
    func getData() {
        articleService.getAll(listener:self)
    }
    
    func setAllArticles(articles: [Article]) {
        self.articles = articles
        self.tableView.reloadData()
    }
}
