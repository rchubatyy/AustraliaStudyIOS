//
//  ApiRequestFetcher.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/20/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class CourseService {
    
    static let instance = CourseService()
    
    private init(){}
    
    //var searchResults : JSON?
    
    var courses : [Course] = [Course()]
    
    var selected : Int?
    var nPages : Int = 1
    var nextPage: Int = 2
    
    var request: Alamofire.Request? = nil
    
    var body : [String:Any] = [
        "filters": "type:course AND locationDetails.country:AU",
        "sessionId" : AuthService.instance.sessionId
    ]
    
    func search(query: String, page: Int? = nil, onComplete: @escaping CompletionHandler) {
        body["query"] = query
        if let p = page{
            body["page"] = p
        }
        else {
            body.removeValue(forKey: "page")
        }
            
    request = Alamofire.request(PRODUCT_SEARCH_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { response in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let searchResults = try! JSON(data: data)
                
                if !searchResults["success"].bool!
                { onComplete(false) }
                else {
                    if page == nil{
                        self.courses.removeAll()
                        self.nPages = searchResults["data"]["nPages"].int!
                        self.nextPage = 2
                    }
                    else {
                        self.nextPage+=1
                    }
                for json in searchResults["data"]["hits"].array!{
                    let course = Course(from: json)
                    
                    self.courses.append(course)
                }
                    print("Query count:\(query.count)")
                onComplete(true)
                }
                }
                else {
                onComplete(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
