//
//  DetailViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 12/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article:Article?
    var login:Login?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setContent(article:Article, login:Login) {
        self.article = article
        self.login = login
    }

}
