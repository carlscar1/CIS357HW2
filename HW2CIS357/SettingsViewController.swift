//
//  SettingsViewController.swift
//  HW2CIS357
//
//  Created by Alexandra MacKay on 9/26/23.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func indicateSelection(distanceUnits: String)
}

class SettingsViewController: UIViewController {
    var pickerData: [String] = [String]()
    var selection : String = "Miles"
    var delegate : SettingsViewControllerDelegate?

    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pickerData = ["Kilometers", "Miles"]
        self.picker.delegate = self
        self.picker.dataSource = self
        if let index = pickerData.firstIndex(of: self.selection) {
            self.picker.selectRow(index, inComponent:0, animated:true) } else {
                self.picker.selectRow(0, inComponent: 0, animated: true)
            }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.indicateSelection(distanceUnits: <#T##String#>)
        }
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.pickerData[row]
    }
}
