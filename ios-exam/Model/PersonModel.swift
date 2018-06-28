//
//  PersonModel.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/26/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import Foundation

class PersonModel: NSObject {
    
    let firstName: String
    let lastName: String
    let birthday: String
    let age: Int
    let emailAddress: String
    let mobileNumber: String
    let address: String
    let contactPerson: String
    let contactPersonPhoneNumber: String
    
    init(withDictionary dictionary: [String: AnyObject]) {
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.birthday = dictionary["birthday"] as? String ?? ""
        self.age = PersonModel.calculateAgeFromBirthday(birthday)
        self.emailAddress = dictionary["emailAddress"] as? String ?? ""
        self.mobileNumber = dictionary["mobileNumber"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.contactPerson = dictionary["contactPerson"] as? String ?? ""
        self.contactPersonPhoneNumber = dictionary["contactPersonPhoneNumber"] as? String ?? ""
        
        super.init()
    }
    
    @objc class func createPersonArray(_ array: [[String: AnyObject]]) -> [PersonModel] {
        return array.map({ (dictionary) -> PersonModel in
            PersonModel(withDictionary: dictionary)
        })
    }
    
    class func calculateAgeFromBirthday(_ birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-DD"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
}

