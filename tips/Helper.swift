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
}