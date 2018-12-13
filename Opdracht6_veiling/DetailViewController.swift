//
//  DetailViewController.swift
//  Opdracht6_veiling
//
//  Created by student on 12/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, BidServiceProtocol, MemberServiceProtocol {
    
    
    
    
    
    var article:Article?
    var login:Login?
    var member:Member?
    var memberService = MemberService()
    
    @IBOutlet weak var lbWelcome: UILabel!
    
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtMinBid: UITextField!
    @IBOutlet weak var txtHighestBid: UITextField!
    
    
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var stepBid: UIStepper!
    
    let bidService = BidService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInFields()
        getBidsOfArticle()
        getMember()
    }
    

    func setContent(article:Article, login:Login) {
        self.article = article
        self.login = login
    }
    
    func fillInFields() {
        lbWelcome.text = "Welcome, " + login!.getEmail()
        
        txtDescription.text = article!.getDescription()
        txtMinBid.text = String(article!.getMinBid())
        
        var highestBid:Double = 0
        for var bid in article!.bids {
            if(highestBid < bid.bid) {
                highestBid = bid.bid
            }
        }
        txtHighestBid.text = String(highestBid)
        
        stepBid.minimumValue = highestBid + 20
        stepBid.maximumValue = highestBid * 100
        stepBid.value = stepBid.minimumValue
        
        lbNumber.text = String(stepBid.value)
    }
    
    func getBidsOfArticle() {
        bidService.getBids(article: self.article!, listener: self)
    }
    
    func setBids(article: Article, bids: [Bid]) {
        reloadField(bids: bids)
    }
    
    func reloadField(bids: [Bid]) {
        var highestBid:Double = 0
        for var bid in bids {
            if(highestBid < bid.bid) {
                highestBid = bid.bid
            }
        }
        txtHighestBid.text = String(highestBid)
        
        if(stepBid.value < highestBid) {
            stepBid.value = highestBid + 20
            lbNumber.text = String(stepBid.value)
        }
    }
    
    func getMember() {
        memberService.getMember(login: self.login!, listener: self)
        
    }
    
    func setMember(member: [Member]) {
        self.member = member[0]
        lbWelcome.text = "Welcome, " + self.member!.getName()
    }

    @IBAction func onPressStepper(_ sender: UIStepper) {
        lbNumber.text = String(sender.value)
    }
    
    @IBAction func onPressPlaceBid(_ sender: Any) {
        var newBid = Bid(id: "", bid: stepBid.value, date: Date.init(), memberId: self.member?.id ?? "")
        bidService.addBid(article: self.article!, bid: newBid)
    }
}
