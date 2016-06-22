//
//  ViewController.swift
//  tips
//
//  Created by LONG HOANG on 6/21/16.
//  Copyright © 2016 LONG HOANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipTextLabel: UILabel!
    
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var horizontalLine: UIView!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        loadSetting()
        calculateTips()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
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
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTips()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
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
}

