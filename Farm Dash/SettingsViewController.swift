//
//  SettingsViewController.swift
//  Farm Dash
//
//  Created by Douglas W. Palme on 7/31/18.
//  Copyright © 2018 Douglas W. Palme. All rights reserved.
//

import UIKit
import AVFoundation


class SettingsViewController: UIViewController {

    
    @IBOutlet weak var musicCtrl: UISwitch!
    @IBOutlet weak var soundCtrl: UISwitch!
    
    let musicSwitch: Bool = true
    let soundSwitch: Bool = true
    
    let defaults = UserDefaults.standard

    override func viewWillAppear(_ animated: Bool) {
        
        // get settings from userdefaults
        if let ourString: String = defaults.string(forKey: "BGMusic") {
           musicCtrl.isOn = Bool(ourString)!
        } else {
            defaults.set(String(musicSwitch), forKey: "BGMusic")
        }
        
        if let soundString: String = defaults.string(forKey: "Sound") {
            soundCtrl.isOn = Bool(soundString)!
        } else {
            defaults.set(String(musicSwitch), forKey: "Sound")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func musicCtrl(_ sender: Any) {
        defaults.set(String(musicCtrl.isOn), forKey: "BGMusic")
    }
    
    @IBAction func soundCtrl(_ sender: Any) {
        defaults.set(String(soundCtrl.isOn), forKey: "Sound")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
