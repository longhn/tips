//
//  SettingsViewController.swift
//  tips
//
//  Created by LONG HOANG on 6/21/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var defaultBillField: UITextField!
    
    @IBOutlet weak var defaultBillLabel: UILabel!
    
    @IBOutlet weak var detaulTipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var saveSettingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultBillField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onValueChanged(sender: AnyObject) {
        // TODO
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = defaultBillField.text else
        {
            return true
        }
        
        let newLength = text.characters.count + string.characters.count - range.length
        
        return newLength <= Helper.billTextFieldLimit
    }
    
    // Load current setting
    private func loadSetting(){
        defaultBillField.text = Helper.getDefaultBillField()
        tipControl.selectedSegmentIndex = Helper.getSelectedSegmentIndex()
    }
}
