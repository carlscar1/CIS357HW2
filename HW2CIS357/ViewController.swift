//
//  ViewController.swift
//  HW2CIS357
//
//  Created by Caroline Carlson on 9/20/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var p1LatInputField: UITextField!
    @IBOutlet weak var p2LatInputField: UITextField!
    @IBOutlet weak var p1LongInputField: UITextField!
    @IBOutlet weak var p2LongInputField: UITextField!
    
    var p1Lat: String = ""
    var p2Lat: String = ""
    var p1Long: String = ""
    var p2Long: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        p1LatInputField.text = p1Lat
        p2LatInputField.text = p2Lat
        p1LongInputField.text = p1Long
        p2LongInputField.text = p2Long
    }


    @IBAction func calculate(_ sender: UIButton) {
        
        //Insert math to calculate distance and bearing
    }
    
    
    @IBAction func goToSettings(_ sender: UIButton) {
        
        
        
    }
    
    
}

