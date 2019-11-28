//
//  CollegeListViewController.swift
//  CSM
//
//  Created by Dheeraj Arora on 12/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var collegeListViewTable: UITableView!
    var arrCollege = [College]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomeImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController!.navigationBar.tintColor = .black
        navigationItem.title = "College List"
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        self.collegeListViewTable.reloadData()
    }
    
    @IBAction func btnGoToNextPageACtion(_ sender: UIBarButtonItem) {
        let next = self.storyboard!.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}
extension CollegeListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListViewCell") as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
        
    }
   
}

extension CollegeListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrCollege = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.collegeListViewTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = self.storyboard!.instantiateViewController(withIdentifier: "CollegeDetailViewController") as! CollegeDetailViewController
         detailView.collegeDetail = arrCollege[indexPath.row]
         detailView.indexRow = indexPath.row
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
