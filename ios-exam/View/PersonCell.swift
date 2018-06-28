//
//  PersonCell.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/27/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func setPersonFullName(_ personName: PersonModel) {
        fullNameLabel.text = personName.lastName + ", " + personName.firstName
    }
}
