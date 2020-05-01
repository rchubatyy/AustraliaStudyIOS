//
//  CourseTableViewCell.swift
//  AustraliaStudy
//
//  Created by user147757 on 9/22/19.
//  Copyright © 2019 Australia Study. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var courseName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
