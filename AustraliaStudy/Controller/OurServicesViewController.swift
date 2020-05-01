//
//  AgencyInfoViewController.swift
//  AustraliaStudy
//
//  Created by user157559 on 1/11/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import UIKit

class OurServicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var agencyTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        agencyTable.delegate=self
        agencyTable.dataSource=self
        //agencyTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AGENCIES.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "agency", for: indexPath) as! AgencyTableViewCell
        cell.showAgency(AGENCIES[indexPath.row])
        return cell
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
