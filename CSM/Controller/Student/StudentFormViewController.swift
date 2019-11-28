//
//  StudentFormViewController.swift
//  CSM
//
//  Created by Dheeraj Arora on 14/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit

class StudentFormViewController: UIViewController {
        @IBOutlet weak var txtStudentName: UITextField!
     @IBOutlet weak var txtStudentEmail: UITextField!
     @IBOutlet weak var txtStudentPhone: UITextField!
    var college:College?
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardTappedOutside()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Student Data Form"
        navigationController!.navigationBar.tintColor = .black
        
    }

    @IBAction func btnSaveClick(_ sender: UIButton) {
        guard let name = txtStudentName.text else { return }
        guard let email = txtStudentEmail.text else { return }
        guard let phone = txtStudentPhone.text else { return }
        guard let mainCollege = college else { return }
        let studentDict = [
            "studentName":name,
            "studentEmail":email,
            "studentPhone":phone
        ]
        DatabaseHelper.shareInstance.saveStudentData(studentDict: studentDict, college: mainCollege)
        self.navigationController?.popViewController(animated: true)

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
extension StudentFormViewController{
    func hideKeyboardTappedOutside()  {
        let showKeyboard:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(showKeyboard)
    }
    
    @objc func DismissKeyboard()  {
        view.endEditing(true)
    }
}
