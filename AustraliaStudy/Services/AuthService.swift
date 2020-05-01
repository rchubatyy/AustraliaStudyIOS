//
//  AuthService.swift
//  AustraliaStudy
//
//  Created by user159725 on 10/20/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import Foundation

class AuthService{

static let instance = AuthService()

public private(set) var loggedIn: Bool
public private(set) var sessionId: String

private init(){
    loggedIn = true
    sessionId = "1568544929820"
}

    
}
