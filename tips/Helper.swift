//
//  Helper.swift
//  tips
//
//  Created by LONG HOANG on 6/22/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import Foundation

/*
 Helper class for tip calculator
 */
class Helper{
    
    static let billTextFieldLimit = 8
    static let resetTimeInterval: NSTimeInterval = 600
    
    // Get default bill field setting
    static func getDefaultBillField() -> String {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let defaultBillField = defaults.stringForKey("defaultBillField"){
            return defaultBillField
        } else {
            return ""
        }
    }
    
    // Get selected segment index setting
    static func getSelectedSegmentIndex() -> Int {
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedSegmentIndex = defaults.integerForKey("selectedSegmentIndex")
        
        return selectedSegmentIndex
    }
    
    // Check if need to reset value for NSUserDefaults
    static func needToReset(openingTime: NSDate?, lastAccess: NSDate?) -> Bool {
        
        guard let accessTime = lastAccess else
        {
            return false
        }
        
        let needToReset = (openingTime!.timeIntervalSinceReferenceDate - accessTime.timeIntervalSinceReferenceDate) > resetTimeInterval
        
        return needToReset
    }
    
    // Reset to default values
    static func resetUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "defaultBillField")
        defaults.setObject(nil, forKey: "selectedSegmentIndex")
        defaults.setObject(nil, forKey: "Theme")
        defaults.synchronize()
    }
}