//
//  StudentListViewController.swift
//  CSM
//
//  Created by Dheeraj Arora on 14/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {

    var arrStudent = [Student]()
    var college:College?
    @IBOutlet weak var studentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()  
        setCustomeImage()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Student List"
        navigationController!.navigationBar.tintColor = .black
        if college?.students?.allObjects != nil{
            arrStudent = college?.students?.allObjects as! [Student]
        }
        //self.arrStudent = DatabaseHelper.shareInstance.getAllStudentData()
        studentTableView.reloadData()
        
    }

    @IBAction func lblGoToStudentFormAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentForm = storyboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        studentForm.college = college
        self.navigationController?.pushViewController(studentForm, animated: true)
    }
   
}

extension StudentListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentListViewCell", for: indexPath) as! StudentListViewCell
        cell.student = arrStudent[indexPath.row]
        return cell
        
    }
   
}
extension StudentListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
