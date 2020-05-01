//
//  BlogsViewController.swift
//  AustraliaStudy
//
//  Created by user157559 on 3/2/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import UIKit

class BlogsViewController: UIViewController {

    @IBOutlet weak var blogContent: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        BlogService.instance.fetchBlogs(){
            success in
            self.blogContent.attributedText = success ? BlogService.instance.content : NSAttributedString(string: "No data loaded")
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
