//
//  EmailViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 28/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit
import FirebaseAuth

class EmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func createUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            guard let user = authResult?.user else { return }
        }
    }
    

}
