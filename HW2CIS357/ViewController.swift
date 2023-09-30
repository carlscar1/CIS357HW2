//
//  ViewController.swift
//  HW2CIS357
//
//  Created by Caroline Carlson on 9/20/23.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {

    @IBOutlet weak var p1LatInputField: UITextField!
    @IBOutlet weak var p2LatInputField: UITextField!
    @IBOutlet weak var p1LongInputField: UITextField!
    @IBOutlet weak var p2LongInputField: UITextField!
    
    @IBOutlet weak var DistanceValue: UILabel!
    @IBOutlet weak var BearingValue: UILabel!
    
    var p1Lat: String = ""
    var p2Lat: String = ""
    var p1Long: String = ""
    var p2Long: String = ""
    var distMeasurement: String = ""
    var distanceUnits = "Miles"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    func indicateSelection(distanceUnits: String) {
        self.distanceUnits = distanceUnits
        self.distMeasurement = "Units: \(distanceUnits)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings" {
            if let dest = segue.destination as? SettingsViewController {
                dest.delegate = self
                dest.selection = self.distanceUnits
            }
        }
    }


    @IBAction func calculate(_ sender: UIButton) {
        p1Lat = p1LatInputField.text!
        p2Lat = p2LatInputField.text!
        p1Long = p1LongInputField.text!
        p2Long = p2LongInputField.text!
        
        //Calulate distance:
        var distance: Float = 0.0
        var earthRadius: Float = 6371
        
        var dLat = degreesToRadians(deg:(Float(p1Lat)! - Float(p2Lat)!))
        var dLong = degreesToRadians(deg:(Float(p1Long)! - Float(p2Long)!))
        var a = sin(dLat/2) * sin(dLat/2) + cos(degreesToRadians(deg:(Float(p1Lat))!)) * cos(degreesToRadians(deg: Float(p2Lat)!)) * sin(dLong/2) * sin(dLong/2)
        var c = 2 * atan2(sqrt(a), sqrt(1-a))
        distance = earthRadius * c
        
        DistanceValue.text = String(distance)
        
        //Calculate bearing:
        var bearing: Float = 0.0
        var x = cos(degreesToRadians(deg: Float(p2Lat)!)) * sin(degreesToRadians(deg:dLong))
        var y = cos(degreesToRadians(deg: Float(p1Lat)!)) * sin(degreesToRadians(deg: Float(p2Lat)!)) - sin(degreesToRadians(deg: Float(p1Lat)!)) * cos(degreesToRadians(deg: Float(p2Lat)!)) * cos(degreesToRadians(deg: dLong))
        bearing = atan2(x,y)
        bearing = radiansToDegrees(rad: bearing)
        
        BearingValue.text = String(bearing)
        
    }
    
    func degreesToRadians(deg: Float) -> Float{
        return deg * Float.pi / 180
    }
    
    func radiansToDegrees(rad: Float) -> Float{
        return rad * 180 / Float.pi
    }
    
    
    @IBAction func goToSettings(_ sender: UIButton) {
        
        
        
    }
    
    
}

