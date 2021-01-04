//
//  SettingsViewController.swift
//  tippify
//
//  Created by Nina on 9/14/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var tipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "TipSegmentIndex")
        tipController.selectedSegmentIndex = tipIndex
    }
    @IBAction func tipValueChanged( sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipController.selectedSegmentIndex, forKey: "TipSegmentIndex")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
