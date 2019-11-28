//
//  CollegeDetailViewController.swift
//  CSM
//
//  Created by Dheeraj Arora on 13/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {
    
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeAddress: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    var collegeDetail: College?
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomeImage()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "College Detail"
        navigationController!.navigationBar.tintColor = .black
        lblCollegeName.text = collegeDetail?.name
        lblCollegeAddress.text = collegeDetail?.address
        lblCollegeCity.text = collegeDetail?.city
        lblCollegeUniversity.text = collegeDetail?.university
        if let students = collegeDetail?.students?.allObjects as? [Student]{
            lblStudent.text = "\(students.count)"
        }else{
            lblStudent.text = "0"
        }
    }
    
    @IBAction func btnEditDataAction(_ sender: UIBarButtonItem) {
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetail = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let studentList = storyboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            studentList.college = collegeDetail
            self.navigationController?.pushViewController(studentList, animated: true)
        }
    }
}
