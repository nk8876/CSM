//
//  StudentListViewCell.swift
//  CSM
//
//  Created by Dheeraj Arora on 14/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class StudentListViewCell: UITableViewCell {

    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentEmail: UILabel!
    @IBOutlet weak var lblStudentPhone: UILabel!
    var student:Student?{
        didSet{
            lblStudentName.text = "Name:-\(student?.name ?? "")"
            lblStudentEmail.text = "Email:-\(student?.email ?? "")"
            lblStudentPhone.text = "Phone:-\(student?.phone ?? "")"
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
