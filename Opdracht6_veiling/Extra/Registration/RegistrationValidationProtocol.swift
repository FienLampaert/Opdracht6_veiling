//
//  RegistrationValidationProtocol.swift
//  Opdracht6_veiling
//
//  Created by student on 05/12/2018.
//  Copyright © 2018 Vives. All rights reserved.
//

import Foundation

protocol RegistrationValidationProtocol {
    func registrationCompleted(login:Login?, error:String?)
}
