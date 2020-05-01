//
//  Constants.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/22/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//
import UIKit
import Foundation

typealias CompletionHandler = (_ success: Bool) -> ()

let ITEMS_PER_PAGE = 25

let PRODUCT_SEARCH_URL = "https://core.geteducation.link/v1/public/products/search?apiKey=pk_prod_ckqnQLghPSTCnkcNf_zrC_y8ytF18gEZayY6LH9gppJqIjd77yw4XuEONrRO9&widgetId=sKDTqhLA9w7AaRRdC"

let SITE_BLOGS_URL = "https://as2.dev.autenta.com.au/wp-json/wp/v2/posts?per_page=1&exclude=1"

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    var html2Attributed: NSAttributedString? {
        do {
            let html = "<style>" +
                "html *" +
                "{" +
                "font-size: 15pt !important;" +
                "color: black !important;" +
                "font-family: Helvetica !important;" +
                "}</style> \(self)"
            guard let data = html.data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

// SEGUES

let SEGUES = ["toOurServicesSegue", "toCourseSearchSegue", "toKnowledgeHubSegue",
              "toSchoolsSegue", "toBlogSegue", "toWorkInAustraliaSegue"]



