//
//  SignUpViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 6/09/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var ovalsGroup: UIImageView!
    
    let genders = ["Female", "Male", "Not defined"]
    
    var genderPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        genderTextField.inputView = genderPickerView
        
        view.sendSubviewToBack(ovalsGroup)
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

extension SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
        genderTextField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
}
