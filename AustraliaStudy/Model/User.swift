//
//  User.swift
//  AustraliaStudy
//
//  Created by user157559 on 1/11/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import Foundation

struct User{
    public private(set) var fullName: String
    public private(set) var email: String
    public private(set) var birthDate: Date
    
    init (fullName: String, email:String, birthDate: Date){
        self.fullName = fullName
        self.email = email
        self.birthDate = birthDate
    }
}
