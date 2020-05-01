//
//  CourseSearchViewController.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/17/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class SchoolsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
       
    //@IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var schoolsTable: UITableView!
    let courseService = CourseService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = nil
        schoolsTable.delegate = self
        schoolsTable.dataSource = self
        //searchResultTable.tableHeaderView = UIView(frame: .zero)
        //searchResultTable.tableFooterView = UIView(frame: .zero)
        //searchBar.delegate = self
        //searchBar.becomeFirstResponder()
        //searchBar.isHidden = true
        //self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.

    }
    
    
    /*override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }*/
    
    /*func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        //self.searchBar.endEditing(true)
        print (indexPath.item)
        return indexPath
    }*/
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
        self.courseService.request?.cancel()
        self.courseService.courses.removeAll()
        self.schoolsTable.reloadData()
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //self.courseService.request?.cancel()
        self.courseService.courses.removeAll()
        self.schoolsTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        courseService.search(query: searchBar.text!){success in
            if success{
                //self.searchResultTable.setContentOffset(CGPoint.zero, animated: true)
            }
            else{
                self.courseService.courses.removeAll()
            }
            self.schoolsTable.reloadData()
        }
        searchBar.endEditing(true)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseService.courses.count /* : 0 searchBar.text!.count > 2 ? */
    }
    
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as? CourseTableViewCell
        cell?.schoolName.text = CourseService.instance.searchResults?["data"]["hits"][indexPath.item]["providerDetails"]["name"].string
        cell?.courseName.text = CourseService.instance.searchResults?["data"]["hits"][indexPath.item]["name"].string
        guard let url = CourseService.instance.searchResults?["data"]["hits"][indexPath.item]["providerDetails"]["marketingDetails"]["logoUrl"].string else { return cell! }
        if let courseImageURL = URL(string: url){
        cell?.courseImage.sd_setShowActivityIndicatorView(true)
        cell?.courseImage.sd_setImage(with: courseImageURL)
        }
        return cell!
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell
        let schoolName = courseService.courses[indexPath.row].schoolName
        if let town = courseService.courses[indexPath.row].town {
            cell.schoolName.text = "\(schoolName ?? ""), \(town)"
        }
        else {
            cell.schoolName.text = schoolName
        }
        cell.courseName.text = courseService.courses[indexPath.row].name
        if let url = courseService.courses[indexPath.row].logoURL{
        if let courseImageURL = URL(string: url){
        //cell?.courseImage.sd_setShowActivityIndicatorView(true)
        cell.courseImage.sd_setImage(with: courseImageURL)
            }
        }
        else{
            cell.courseImage.sd_setImage(with: nil)
        }
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //self.searchBar.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /*if indexPath.item == courseService.courses.count-1 {
            if courseService.nextPage <= courseService.nPages{
                courseService.search(query: self.searchBar.text!, page: courseService.nextPage){success in
                    if success{
                        self.searchResultTable.reloadData()
                    }
                }
            }
        }*/
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseService.selected = indexPath.item
        performSegue(withIdentifier: "showCourse", sender: nil)
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
