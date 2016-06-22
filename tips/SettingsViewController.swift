//
//  SettingsViewController.swift
//  tips
//
//  Created by LONG HOANG on 6/21/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultBillField: UITextField!
    
    @IBOutlet weak var defaultBillLabel: UILabel!
    
    @IBOutlet weak var detaulTipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var saveSettingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detaulTipLabel.alpha = 0
        self.tipControl.alpha = 0
        self.saveSettingButton.alpha = 0
        self.defaultBillField.alpha = 0
        self.defaultBillLabel.alpha = 0

        // Do any additional setup after loading the view.
        loadSetting()

        UIView.animateWithDuration(1.5, delay: 0.4, options: .CurveEaseOut, animations: {
            self.detaulTipLabel.alpha = 1
            self.tipControl.alpha = 1
            self.saveSettingButton.alpha = 1
            self.defaultBillField.alpha = 1
            self.defaultBillLabel.alpha = 1
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveSetting(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(NSString(string: defaultBillField.text!).doubleValue, forKey: "defaultBillField")
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "selectedSegmentIndex")
        defaults.synchronize()
    }
    
    // Load current setting
    private func loadSetting(){
        defaultBillField.text = Helper.getDefaultBillField()
        tipControl.selectedSegmentIndex = Helper.getSelectedSegmentIndex()
    }

    @IBAction func onValueChanged(sender: AnyObject) {
        // TODO
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
