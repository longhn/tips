//
//  ViewController.swift
//  tips
//
//  Created by LONG HOANG on 6/21/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipTextLabel: UILabel!
    
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var horizontalLine: UIView!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set billField delegate
        billField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didBecomeActive), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.billField.becomeFirstResponder()
        loadSetting()
        calculateTips()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        loadTheme()
        
        self.billField.alpha = 0
        self.billLabel.alpha = 0
        self.tipLabel.alpha = 0
        self.tipTextLabel.alpha = 0
        self.horizontalLine.alpha = 0
        self.totalTextLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.tipControl.alpha = 0
        
        UIView.animateWithDuration(0.5, animations: {
            self.billField.alpha = 1
            self.billLabel.alpha = 1
            self.tipLabel.alpha = 1
            self.tipTextLabel.alpha = 1
            self.horizontalLine.alpha = 1
            self.totalTextLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.tipControl.alpha = 1
        })
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTips()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    //textField delegate for billField
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = billField.text else
        {
            return true
        }
        
        let newLength = text.characters.count + string.characters.count - range.length
        
        return newLength <= Helper.billTextFieldLimit
    }
    
    // Calculate tips and total
    private func calculateTips() {
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    // Load current setting
    private func loadSetting(){
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        billField.text = Helper.getDefaultBillField()
        tipControl.selectedSegmentIndex = Helper.getSelectedSegmentIndex()
    }
    
    // Load theme for tips
    private func loadTheme() {
        Style.loadTheme()
        self.view.backgroundColor = Style.backgroundColor
        self.horizontalLine.backgroundColor = Style.horizontalLineBackgroundColor
        self.tipControl.tintColor = Style.tipControlBackgroundColor
        self.barButtonItem.tintColor = Style.navigationTextColor
        self.billLabel.textColor = Style.textColor
        self.tipLabel.textColor = Style.textColor
        self.tipTextLabel.textColor = Style.textColor
        self.totalLabel.textColor = Style.textColor
        self.totalTextLabel.textColor = Style.textColor
        self.billLabel.textColor = Style.textColor
    }
    
    // didBecomeActive observer
    func didBecomeActive() {
        loadTheme()
        loadSetting()
        calculateTips()
    }
}

