//
//  ViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 28/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    

    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

}

