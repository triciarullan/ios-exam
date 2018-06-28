//
//  PersonDetailsViewController.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/26/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import UIKit

struct PersonDetails {
    struct Identifier {
        static let personDetailsCellReuseIdentifier = "PersonDetailsCell"
    }
    
    struct Constants {
        static let personDetailsCellHeight: CGFloat = 325
        static let personDetailsRow = 1
    }
}

class PersonDetailsViewController: UIViewController {
    
    @objc var personDetails: PersonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
// MARK: UITableViewDelegate
extension PersonDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PersonDetails.Constants.personDetailsCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

// MARK: - UITableViewDataSource
extension PersonDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonDetails.Identifier.personDetailsCellReuseIdentifier, for: indexPath) as! PersonDetailsCell
        cell.setPersonDetails(personDetails!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonDetails.Constants.personDetailsRow
    }
}
