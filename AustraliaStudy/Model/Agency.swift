//
//  Agency.swift
//  AustraliaStudy
//
//  Created by user157559 on 1/11/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import Foundation

struct Agency{
    var city: String
    var address: String
    var agentName: String
    var phone: String
    var email: String
    
    init(city: String, address: String, agentName: String, phone: String, email: String){
        self.city = city
        self.address = address
        self.agentName = agentName
        self.phone = phone
        self.email = email
    }
}
