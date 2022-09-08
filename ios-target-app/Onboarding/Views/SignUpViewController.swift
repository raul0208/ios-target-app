//
//  SignUpViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 6/09/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var genderTextField: UITextField!
    
    private let genders = ["Female", "Male", "Not defined"]
    
    private var genderPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        genderTextField.inputView = genderPickerView
    }

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
