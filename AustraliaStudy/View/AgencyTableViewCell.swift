//
//  AgencyTableViewCell.swift
//  AustraliaStudy
//
//  Created by user157559 on 1/11/20.
//  Copyright © 2020 Australia Study. All rights reserved.
//

import UIKit

class AgencyTableViewCell: UITableViewCell {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showAgency(_ agency: Agency){
        self.city.text = agency.city.uppercased() + " OFFICE"
        self.address.text = agency.address
        self.agentName.text = agency.agentName
        self.phone.text = "Phone: " + agency.phone
        self.email.text = "E-mail: " + agency.email
    }

}
