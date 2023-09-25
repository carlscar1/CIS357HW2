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

        p1LatInputField.text = p1Lat
        p2LatInputField.text = p2Lat
        p1LongInputField.text = p1Long
        p2LongInputField.text = p2Long
    }


    @IBAction func calculate(_ sender: UIButton) {
        //Calulate distance:
        var distance: Float = 0.0
        var earthRadius: Float = 6371
        
        var dLat = degreesToRadians(deg:(Float(p1Lat)! - Float(p2Lat)!))
        var dLong = degreesToRadians(deg:(Float(p1Long)! - Float(p2Long)!))
        var a = sin(dLat/2) * sin(dLat/2) + cos(degreesToRadians(deg:(Float(p1Lat))!)) * cos(degreesToRadians(deg: Float(p2Lat)!)) * sin(dLong/2) * sin(dLong/2)
        var c = 2 * atan2(sqrt(a), sqrt(1-a))
        distance = earthRadius * c
        
        //Calculate bearing:
        var bearing: Float = 0.0
        var x = cos(degreesToRadians(deg: Float(p2Lat)!)) * sin(degreesToRadians(deg:dLong))
        var y = cos(degreesToRadians(deg: Float(p1Lat)!)) * sin(degreesToRadians(deg: Float(p2Lat)!)) - sin(degreesToRadians(deg: Float(p1Lat)!)) * cos(degreesToRadians(deg: Float(p2Lat)!)) * cos(degreesToRadians(deg: dLong))
        bearing = atan2(x,y)
        bearing = radiansToDegrees(rad: bearing)
        
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

