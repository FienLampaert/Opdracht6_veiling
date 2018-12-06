//
//  LoginViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginValidationProtocol, RootVCProtocol {
    
    
    
    //inputfields
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    //labels
    @IBOutlet weak var lbError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickedSignIn(_ sender: Any) {
        let signInEmptyFields = LoginValidation.checkEmptyFields(email: txtEmail.text ?? "", password: txtPassword.text ?? "")
        
        if(signInEmptyFields.isEmpty) {
            LoginValidation.signIn(email: txtEmail.text ?? "", password: txtPassword.text ?? "", listener: self)
        }
        else {
            lbError.text = signInEmptyFields
        }
    }
    
    func loginCompleted(login: Login?, error: String?) {
        lbError.text = error ?? ""
        
        if let l = login {
            navigateToTable(login: l)
        }
    }
    
    
    
    func navigateToTable(login: Login){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "bidsTableViewController") as! BidsTableViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}
