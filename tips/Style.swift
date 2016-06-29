//
//  Style.swift
//  tips
//
//  Created by LONG HOANG on 6/28/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

struct Style{

    static var backgroundColor = UIColor.whiteColor()
    static var horizontalLineBackgroundColor = UIColor.blackColor()
    static var textColor = UIColor.blackColor()
    static var tipControlBackgroundColor = UIColor.blackColor()
    static var navigationTextColor = UIColor.blackColor()
    
    static let availableThemes = ["White", "Light Gray", "Magenta", "Purple"]
    
    static func themeLightGray(){
        backgroundColor = UIColor.lightGrayColor()
        tipControlBackgroundColor = UIColor.whiteColor()
        horizontalLineBackgroundColor = UIColor.whiteColor()
        textColor = UIColor.whiteColor()
        navigationTextColor = UIColor.lightGrayColor()
    }
    
    static func themeWhite(){
        backgroundColor = UIColor.whiteColor()
        tipControlBackgroundColor = UIColor.blackColor()
        horizontalLineBackgroundColor = UIColor.blackColor()
        textColor = UIColor.blackColor()
        navigationTextColor = UIColor.blackColor()
    }
    
    static func themeMagenta(){
        backgroundColor = UIColor.magentaColor()
        tipControlBackgroundColor = UIColor.blackColor()
        horizontalLineBackgroundColor = UIColor.blackColor()
        textColor = UIColor.blackColor()
        navigationTextColor = UIColor.magentaColor()
    }
    
    static func themePurple(){
        backgroundColor = UIColor.purpleColor()
        tipControlBackgroundColor = UIColor.lightTextColor()
        horizontalLineBackgroundColor = UIColor.lightTextColor()
        textColor = UIColor.lightTextColor()
        navigationTextColor = UIColor.purpleColor()
    }
    
    static func loadTheme(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let name = defaults.stringForKey("Theme"){
            
            switch name {
                case "Light Gray":
                    themeLightGray()
                case "Magenta":
                    themeMagenta()
                case "Purple":
                    themePurple()
                default:
                    themeWhite()
            }
            
        }else{
            defaults.setObject("White", forKey: "Theme")
            themeWhite()
        }
    }
    
    static func getSelectedThemeIndex() -> Int {
        var index = 0
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let name = defaults.stringForKey("Theme"){
            index = name == "" ? 0 : availableThemes.indexOf(name)!
        }
        
        return index
    }
    
}