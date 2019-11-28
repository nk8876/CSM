//
//  CollegeFormViewController.swift
//  CSM
//
//  Created by Dheeraj Arora on 12/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeAddress: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    var collegeDetail: College?
    var isUpdate = false
    var indexRow = Int()
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCollegeName.text = collegeDetail?.name
        txtCollegeAddress.text = collegeDetail?.address
        txtCollegeCity.text = collegeDetail?.city
        txtCollegeUniversity.text = collegeDetail?.university

        hideKeyboardTappedOutside()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            navigationItem.title = "College Data Update Form"
            lblTitle.text = "Update College Data"
            btnSave.setTitle("Update", for: .normal)
        }else{
            navigationItem.title = "College Data Save Form"
            lblTitle.text = "Save College Data"
             btnSave.setTitle("Save", for: .normal)

        }
    }
    @objc func keyboardWillChange(notification:Notification)
    {
        guard let heightRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification
        {
            view.frame.origin.y = -heightRect.height + 300
        }else{
            view.frame.origin.y = 0
        }
       
    }
    deinit {
        //stop listening for keyboard hide/show events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }

}
  //MARK:- Action
  extension CollegeFormViewController{
    @IBAction func btnSaveCollegeDataAction(_ sender: UIButton) {
        self.saveCollegeData()
        self.navigationController?.popViewController(animated: true)
    }
}

  //MARK:- Methods
  extension CollegeFormViewController{
    func saveCollegeData() {
         guard let collegeName = txtCollegeName.text else { return }
         guard let collegeAddress = txtCollegeAddress.text else { return }
         guard let collegeCity = txtCollegeCity.text else { return }
         guard let collegeUniversity = txtCollegeUniversity.text else { return }
        
         let  collegeDict = [
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity
        ]
        if isUpdate{
            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
        }else{
            DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict )
         }
    }
}
extension CollegeFormViewController{
    func hideKeyboardTappedOutside()  {
        let showKeyboard:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(showKeyboard)
    }
    
    @objc func DismissKeyboard()  {
        view.endEditing(true)
    }
}
