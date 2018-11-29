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

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lbTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func createUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            print("error " + error.debugDescription)
            print("authResult " + authResult.debugDescription)
            guard let user = authResult?.user else { return }
        }
    }
    
    func signIn(email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            print("error" + error.debugDescription)
            print("user" + user.debugDescription)
        }
    }
    
    @IBAction func clickRegisterBtn(_ sender: Any) {
        
        if let email = txtEmail.text ,let password = txtPassword.text {
            createUser(email: email, password: password)
            lbTest.text = "JAAAAAA"
        }
        
//        if let email = txtEmail.text ,let password = txtPassword.text {
//            signIn(email: email, password: password)
//            lbTest.text = "JAAAAAA"
//        }
        
    }
    
}
