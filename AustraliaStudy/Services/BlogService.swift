//
//  BlogService.swift
//  AustraliaStudy
//
//  Created by user157559 on 3/2/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class BlogService{
    
    static let instance = BlogService()
    
    private init(){}
    
    var content: NSAttributedString?
    
    func fetchBlogs(onComplete: @escaping CompletionHandler){
        Alamofire.request(SITE_BLOGS_URL, method: .get, encoding: JSONEncoding.default, headers: HEADER).responseJSON {response in
            guard let data = response.data else { return }
            let blogs = try! JSON(data: data)
            let html = blogs[0]["content"]["rendered"].string!.html2Attributed
            self.content = html
            onComplete(true)
        }
    }
    
    
}
