//
//  ViewController.swift
//  tippify
//
//  Created by Nina on 9/14/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var TwoPeopleLabel: UILabel!
    @IBOutlet weak var ThreePeopleLabel: UILabel!
    @IBOutlet weak var FourPeopleLabel: UILabel!
    @IBOutlet weak var SplitView: UIView!
    @IBOutlet weak var ProcessView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        // Making the textfield as the first responder
        self.billField.becomeFirstResponder()
        
        // Making keyboard only numeric 
        self.billField.keyboardType = .decimalPad
        
        
        let defaults = UserDefaults.standard
        
        if (defaults.object(forKey: "BillAmount") != nil) {
            let billAmount = defaults.double(forKey: "BillAmount")
            // Leave the placeholder if the amount is 0
            if (billAmount != 0) {
                billField.text = String(format: "%.2f", billAmount)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "TipSegmentIndex")
        tipControl.selectedSegmentIndex = tipIndex
        calculateTip(self)
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        UIView.animate(withDuration: 1, animations: {
        self.SplitView.alpha = 1
        })
    }
    
    @IBAction func beganEditing(_ sender: Any ) {
        UIView.animate(withDuration: 0.5, animations: {
            self.SplitView.alpha = 0
        })
    }    
    @IBAction func calculateTip(_ sender: Any) {
        
        
        // get bill amount
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]

        let total = bill + tip
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "BillAmount")
        defaults.synchronize()
        
        // update the tip and total bill
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        TwoPeopleLabel.text = String(format: "$%.2f", total / 2)
        ThreePeopleLabel.text = String(format: "$%.2f", total / 3)
        FourPeopleLabel.text = String(format: "$%.2f", total / 4)
    }
    
}

