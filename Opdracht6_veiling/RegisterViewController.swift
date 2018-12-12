//
//  RegisterViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 29/11/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController , RegistrationValidationProtocol {
    
    //inputfields
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPasswordRepeat: UITextField!
    @IBOutlet weak var pvDob: UIDatePicker!
    
    //buttons
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    //labels
    @IBOutlet weak var lbError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func clickedRegister(_ sender: Any) {
        let registrationEmptyFields = RegistrationValidation.checkEmptyFields(name: txtUsername.text ?? "", email: txtEmail.text ?? "", password: txtPassword.text ?? "", passwordValidation: txtPasswordRepeat.text ?? "")
        
        if(registrationEmptyFields.isEmpty) {
            RegistrationValidation.validate(name: txtUsername.text ?? "", email: txtEmail.text ?? "", password: txtPassword.text ?? "", passwordValidation: txtPasswordRepeat.text ?? "", birthDate: pvDob.date , listener: self)
        }
        else {
            lbError.text = registrationEmptyFields
        }
    }
    
    
    func registrationCompleted(login: Login?, error: String?) {
        if let l = login {
            let result = RegistrationValidation.addMember(login: l, name: txtUsername.text ?? "", birthDate: pvDob.date)
            if(!result.isEmpty){
                lbError.text = result
            }
            else {
                lbError.text =  ""
                (self.navigationController?.viewControllers[0] as! RootVCProtocol).navigateToTable(login:l)
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            lbError.text = error ?? ""
        }
    }
    
//    func giveLoginDataToRoot(login:Login) {
//        self.navigationController?.viewControllers[0] as! RootVCProtocol.setLogin(login:login!)
//    }
//
//    func navigateTest(){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "BidsTableViewController") as! BidsTableViewController
//        vc.setContent(Login:login)
//        self.present(vc, animated: true, completion: nil)
//    }
}
