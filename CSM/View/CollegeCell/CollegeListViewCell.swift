//
//  CollegeListViewCell.swift
//  CSM
//
//  Created by Dheeraj Arora on 12/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class CollegeListViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!

     var college: College?{
        didSet{
            lblCollegeName.text = "Name:- \(college?.name ?? "")"
            lblCollegeAddress.text = "Address:- \(college?.address ?? "")"
            lblCollegeCity.text = "City:- \(college?.city ?? "")"
            lblCollegeUniversity.text = "University:- \(college?.university ?? "")"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
