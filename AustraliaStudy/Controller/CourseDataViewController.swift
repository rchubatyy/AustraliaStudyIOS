//
//  CourseDataViewController.swift
//  AustraliaStudy
//
//  Created by user147757 on 10/8/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

class CourseDataViewController: UIViewController {
    
    let course = CourseService.instance.courses[CourseService.instance.selected!]
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var visitWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = course.logoURL{
        if let imageURL = URL(string: image){
        //logo.sd_setShowActivityIndicatorView(true)
        logo.sd_setImage(with: imageURL)
        }
        }
        schoolName.text = course.schoolName
        courseName.text = course.name
        category.text = "Category: \(course.category)"
        field.text = "Field: \(course.field)"
        address.text = course.address
        address.isUserInteractionEnabled = true
        visitWebsite.isUserInteractionEnabled = true
        let map = UITapGestureRecognizer(target: self, action: #selector(openLocation))
        address.addGestureRecognizer(map)
        let link = UITapGestureRecognizer(target: self, action: #selector(goToWebsite))
        visitWebsite.addGestureRecognizer(link)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goToWebsite(){
        if let site = course.link{
            if let url = URL(string: site){
                UIApplication.shared.open(url)
            }
        }
    }
    
    @objc func openLocation(){
        guard let loc = course.location else { return }
        let latitude:CLLocationDegrees =  loc.lat
        let longitude:CLLocationDegrees =  loc.lng
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = course.schoolName
        mapItem.openInMaps(launchOptions: [:])
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
