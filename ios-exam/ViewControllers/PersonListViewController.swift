//
//  ViewController.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/26/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import UIKit

struct PersonList {
    
    struct Identifier {
        static let personCellReuseIdentifier = "PersonCell"
        static let personDetailsViewControllerIdentifier = "PersonDetailsViewController"
        static let mainStoryboardIdentifier = "Main"
    }
    
    struct Constants {
        static let personCellHeight: CGFloat = 50.0
        static let personListDefaultRow = 0
    }
}

class PersonListViewController: UIViewController {

    fileprivate var personList: [PersonModel]?
    fileprivate var selectedIndexPath : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Load Person list from local
        loadPersonList()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PersonListViewController {
    @objc fileprivate func loadPersonList() {
        CacheManager.sharedInstance.loadPersonList(completionBlock: { response in
            for value in response.values {
                self.personList = PersonModel.createPersonArray(value as! [[String : AnyObject]])
            }
        })
    }
}

// MARK: UITableViewDelegate
extension PersonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PersonList.Constants.personCellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: PersonList.Identifier.mainStoryboardIdentifier, bundle: nil).instantiateViewController(withIdentifier: PersonList.Identifier.personDetailsViewControllerIdentifier) as? PersonDetailsViewController {
            vc.personDetails = personList![indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonList.Identifier.personCellReuseIdentifier, for: indexPath) as! PersonCell
        let personModel: PersonModel = personList![indexPath.row]
        cell.setPersonFullName(personModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let personList = personList, personList.count > 0 else {
            return PersonList.Constants.personListDefaultRow
        }
        return personList.count
    }
}
