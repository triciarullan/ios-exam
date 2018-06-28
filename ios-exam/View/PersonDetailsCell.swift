//
//  PersonDetailsCell.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/27/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//


import UIKit

class PersonDetailsCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var contactPerson: UILabel!
    @IBOutlet weak var contactPersonPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setPersonDetails(_ personDetails: PersonModel) {
        firstName.text = "First Name: \(personDetails.firstName)"
        lastName.text = "Last Name: \(personDetails.lastName)"
        birthday.text = "Birthday: \(personDetails.birthday)"
        age.text = "Age: \(personDetails.age)"
        emailAddress.text = "Email Address: \(personDetails.emailAddress)"
        mobileNumber.text = "Mobile Number: \(personDetails.mobileNumber)"
        address.text = "Address: \(personDetails.address)"
        contactPerson.text = "Contact Person: \( personDetails.contactPersonPhoneNumber)"
        contactPersonPhoneNumber.text = "Contact Person's Phone Number: \(personDetails.contactPersonPhoneNumber)"
    }
    
}

