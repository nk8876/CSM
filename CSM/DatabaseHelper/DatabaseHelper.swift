//
//  DatabaseHelper.swift
//  CSM
//
//  Created by Dheeraj Arora on 12/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
     static let shareInstance = DatabaseHelper()
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //SAVE COLLEGE DATA
    func saveCollegeData(collegeDict:[String:String]) {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]
        do {
            try context.save()
        } catch let error {
            print("Can't Save Data, Error is: \(error.localizedDescription)")
        }
        
    }
    
    //GET COLLEGE DATA
    func getAllCollegeData() -> [College] {
        var arrCollege = [College]()
        let fetchCollegeData = NSFetchRequest<NSManagedObject>(entityName: "College")
        do {
            arrCollege = try context.fetch(fetchCollegeData) as! [College]
        } catch let error {
            print("Error in fetching college data: \(error.localizedDescription)")
        }
        
        return arrCollege
    }

     //DELETE COLLEGE DATA
    func deleteData(index:Int) ->[College]  {
        var college = getAllCollegeData()  //Get Data
        context.delete(college[index])    //Remove From CoreData
        college.remove(at: index)         //Remove From Array College
        do {
            try context.save()
        } catch  {
            print("can not delete data")
        }
        return college
    }
    
    //UPDATE COLLEGE DATA
    func editCollegeData(collegeDict: [String:String], index: Int) {
        //original data
        var college = getAllCollegeData()
        
        //edit data
        college[index].name = collegeDict["collegeName"]
        college[index].address = collegeDict["collegeAddress"]
        college[index].city = collegeDict["collegeCity"]
        college[index].university = collegeDict["collegeUniversity"]
        do {
            try context.save()
        } catch let error {
            print("Error in edit data: \(error)")
        }
        
    }
    
    //SAVE STUDENT DATA
    func saveStudentData(studentDict:[String:String], college: College) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = studentDict["studentName"]
        student.email = studentDict["studentEmail"]
        student.phone = studentDict["studentPhone"]
        student.universities = college
       
        do {
            try context.save()
        } catch let error {
            print("Can't Save Data, Error is: \(error.localizedDescription)")
        }
    }
    
    //GET STUDENT DATA
    func getAllStudentData() -> [Student] {
        var arrStudent = [Student]()
        let fetchStudentData = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            arrStudent = try context.fetch(fetchStudentData) as! [Student]
        } catch let error {
            print("Error in fetching college data: \(error.localizedDescription)")
        }
        
        return arrStudent
    }
}
