//
//  CacheManager.swift
//  ios-exam
//
//  Created by Tricia Rullan on 6/26/18.
//  Copyright © 2018 Tricia Rullan. All rights reserved.
//

import Foundation

typealias CacheManagerLoadPersonListCompletionBlock = (Dictionary<String, AnyObject>) -> Void
typealias CacheManagerInitializeLocalCachePersonListCompletionBlock = (Dictionary<String, AnyObject>) -> Void

struct CacheManagerStruct {
    struct Identifier {
        static let cacheManagerPersonList = "personList"
    }
}

class CacheManager: NSObject {
    
    // MARK: - Shared Instance
    static let sharedInstance: CacheManager = {
        let instance = CacheManager()
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    func initializeLocalCacheLoading(completionBlock: CacheManagerInitializeLocalCachePersonListCompletionBlock) {
        SessionManager.sharedInstance.loadPersonList(completion: { response in
            completionBlock(response)
        }, failure: { error in
            
        })
    }
    
    @objc func loadPersonList(completionBlock: CacheManagerLoadPersonListCompletionBlock) {
        let savedPersonList = UserDefaults.standard.dictionary(forKey: CacheManagerStruct.Identifier.cacheManagerPersonList)
        if savedPersonList == nil {
            initializeLocalCacheLoading(completionBlock: { list in
                UserDefaults.standard.set(list, forKey:CacheManagerStruct.Identifier.cacheManagerPersonList)
                completionBlock(list)
            })
        } else {
            let personList =  UserDefaults.standard.dictionary(forKey: CacheManagerStruct.Identifier.cacheManagerPersonList)
            completionBlock(personList! as Dictionary<String, AnyObject>)
        }
    }
    
}
