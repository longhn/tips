//
//  NSUserDefaultsExt.swift
//  tips
//
//  Created by LONG HOANG on 6/28/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    
    var lastAccessDate: NSDate? {
        get {
            return objectForKey("lastAccessDate") as? NSDate
        }
        set {
            setObject(newValue, forKey: "lastAccessDate")
        }
    }
}