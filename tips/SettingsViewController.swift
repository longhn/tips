//
//  SettingsViewController.swift
//  tips
//
//  Created by LONG HOANG on 6/21/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var defaultBillField: UITextField!
    
    @IBOutlet weak var defaultBillLabel: UILabel!
    
    @IBOutlet weak var detaulTipLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var saveSettingButton: UIButton!
    
    @IBOutlet weak var themeTableView: UITableView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    private var selectedTheme: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultBillField.delegate = self
        tapGesture.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.tintColor = Style.navigationTextColor
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
    
    // Handle SaveSetting action
    @IBAction func SaveSetting(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(NSString(string: defaultBillField.text!).doubleValue, forKey: "defaultBillField")
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "selectedSegmentIndex")
        defaults.setObject(selectedTheme, forKey: "Theme")
        defaults.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onValueChanged(sender: AnyObject) {
        // TODO
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
  
    // Validate for textfield
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
        
        let indexPath = NSIndexPath(forRow: Style.getSelectedThemeIndex(), inSection: 0)
        themeTableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: .None)
    }
    
    // Load list of theme into table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ThemeLabelCell", forIndexPath: indexPath)
        let theme = Style.availableThemes[indexPath.row]
        cell.textLabel?.text = theme
        
        return cell
    }
    
    // Return number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Style.availableThemes.count
    }
    
    // Handle selecting table row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedTheme = Style.availableThemes[indexPath.row]
    }
    
    // UIGestureRecognizerDelegate method
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        
        if touch.view != nil && touch.view!.isDescendantOfView(self.themeTableView) {
            return false
        }
        
        return true
    }
}
