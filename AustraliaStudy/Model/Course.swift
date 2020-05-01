//
//  Product.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/23/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Course{
    public private(set) var name: String
    public private(set) var schoolName: String?
    public private(set) var logoURL: String?
    public private(set) var description: String?
    public private(set) var price: Int = 0
    public private(set) var numPayments: Int = 1
    public private(set) var careers: [String] = []
    public private(set) var subjects: [String] = []
    public private(set) var duration: Int = 0
    public private(set) var location: (lat: Double, lng: Double)?
    public private(set) var town: String?
    public private(set) var address: String?
    public private(set) var category: String
    public private(set) var field: String
    public private(set) var link: String?
    
    
    init(from json: JSON){
        let locationDetails = json["locationDetails"]
        let courseDetails = json["courseDetails"]
        let providerDetails = json["providerDetails"]
        let marketingDetails = providerDetails["marketingDetails"]
        self.name = json["name"].string!
        if let schoolName = providerDetails["name"].string{
            self.schoolName = schoolName.components(separatedBy: ",")[0]
        }
        if let logoURL = marketingDetails["logoUrl"].string{
            self.logoURL = logoURL
        }
        if let lat = locationDetails["latitude"].double, let lng = locationDetails["longitude"].double{
            self.location = (lat, lng)
        }
        if let town = locationDetails["name"].string{
            self.town = town
        }
        if let address = locationDetails["formattedAddress"].string{
            self.address = address
        }
        if let category = courseDetails["category"].string
        { self.category = category.count > 3 ? category.capitalized : category.uppercased() } else
        { self.category = "None" }
        if let field = courseDetails["field"].string
        { self.field = field.capitalized } else
        { self.field = "None" }
        if let link = marketingDetails["websiteUrl"].string{
            self.link = link
        }
    }
    
    init(){
            self.name = "Diploma of Social Media Marketing"
            self.schoolName = "Australian College of Business Intelligence"
            self.logoURL = "https://res.cloudinary.com/education-link/image/upload/v1515048117/school/HwFDv2QvQ8NJr6aNd/logo/logo.jpg/logo_bdywez.jpg"
            self.description = "The 10118NAT Diploma of Social Media Marketing is a nationally accredited and nationally recognised qualification in social media marketing, the first of its kind in Australia and around the world. The course is created by social media gurus from Australia, USA and the UK, so your social media marketing skills will be immediately applicable in the real world./nThe 10118NAT Diploma of Social Media Marketing is a unique course specifically tailored to enhance knowledge in social media for business development. The course focuses on hands-on learning, including face-to-face tutorials, online learning and industry workshops. "
            self.category = "Diploma"
            self.field = "Marketing"
        self.town = "Sydney"
            self.price = 5600
            self.numPayments = 6
            self.duration = 52
        self.careers = ["Head of Digital Marketing",
                        "Head of Social Media",
                        "Social Media Manager",
                        "Social Media Consultant",
                        "Social Media Strategist",
                        "Social Media Coordinator",
                        "Social Media Community Manager",
                        "Digital Marketing Strategist",
                        "Content Marketing Manager",
                        "Content Strategist"]
        self.subjects = ["Plan, implement and manage blog and content marketing",
            "Plan, Implement and Manage Mainstream Social Media Marketing strategies",
        "Plan, Implement and Manage Niche Social Media Marketing strategies",
        "Establish and Build a Strong Personal Brand in Social Media",
            "Plan, Implement and Manage Email Marketing",
        "Design and Develop an Integrated Marketing Communication Plan",
        "Establish and Adjust the Marketing mix",
        "Interpret market trends and developments",
            "Undertake Project Work"]
        self.link = "https://www.acbi.edu.au/diploma-of-social-media-marketing"
    }
}
