//
//  ViewController.swift
//  tips
//
//  Created by Guest User on 14/12/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var total_leftMargin: NSLayoutConstraint!
    
    @IBOutlet weak var grandTotal_rightMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let intValue = defaults.integerForKey("defaultSetting")
        tipControl.selectedSegmentIndex = intValue
        
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //initally set constant to value that pushed view out of sight
        self.total_leftMargin.constant = -108
        self.grandTotal_rightMargin.constant = -108
        self.view.layoutIfNeeded()
        
        //animate the views back in sight by setting correct values for constraints
        UIView.animateWithDuration(0.45, animations: {
            
            self.total_leftMargin.constant = 35
            self.grandTotal_rightMargin.constant = 25
            
            self.view.layoutIfNeeded()
        })

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = NSString(string:billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "%.2f",total)
        
        
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }

}

