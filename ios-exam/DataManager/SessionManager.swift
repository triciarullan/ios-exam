//
//  SessionManager.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/26/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import Foundation

typealias SessionManagerLoadPersonListCompletionBlock = (Dictionary<String, AnyObject>) -> Void
typealias SessionManagerFailureCompletionBlock = (String) -> Void

class SessionManager: NSObject {

    // MARK: - Shared Instance
    static let sharedInstance: SessionManager = {
        let instance = SessionManager()
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    func loadPersonList(completion: SessionManagerLoadPersonListCompletionBlock, failure : SessionManagerFailureCompletionBlock) {
        if let path = Bundle.main.path(forResource: "person", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)                
                completion((jsonResult as? Dictionary<String, AnyObject>)!)
            } catch {
                failure("Error")
            }
        }
    }
}
