//
//  SignUpViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 6/09/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let genders = ["Female", "Male", "Not defined"]
    
    private lazy var ovalsImageView = UIImageView()
    
    private lazy var titleLabel = UILabel(
        text: "general_target_title".localized,
        size: .big,
        isBold: true
    )
    
    private lazy var nameLabel = UILabel(
        text: "sign_up_name_label".localized,
        size: .normal
    )
    
    private lazy var nameField = UITextField(target: self)
    
    private lazy var emailLabel = UILabel(
        text: "email_label".localized,
        size: .normal
    )
    
    private lazy var emailField = UITextField(target: self)
    
    private lazy var passwordLabel = UILabel(
        text: "password_label".localized,
        size: .normal
    )
    
    private lazy var passwordField = UITextField(
        target: self,
        placeholder: "sign_up_password_placeholder".localized,
        isPassword: true
    )
    
    private lazy var confirmPasswordLabel = UILabel(
        text: "sign_up_confirm_password_label".localized,
        size: .normal
    )
    
    private lazy var confirmPasswordField = UITextField(
        target: self,
        isPassword: true
    )
    
    private lazy var genderLabel = UILabel(
        text: "sign_up_gender_label".localized,
        size: .normal
    )
    
    private lazy var genderField = UITextField(
        target: self,
        placeholder: "sign_up_gender_placeholder".localized
    )
    
    private lazy var genderPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var signUpButton = UIButton(text: "sign_up_button".localized)
    
    private lazy var lineView = UIView()
        
    private lazy var signInButton = UIButton(
        color: .clear,
        text: "sign_in_button".localized,
        textColor: .black,
        target: self,
        action: #selector(signInTapped)
    )
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setViews() {
        view.addSubviews([
            ovalsImageView,
            scrollView
        ])
        view.backgroundColor = .white
        scrollView.addSubview(stackView)
        
        let ovalsImage = UIImage(named: "ovalsGroup")
        ovalsImageView.contentMode = UIView.ContentMode.scaleAspectFill
        ovalsImageView.frame.size.width = view.bounds.width
        ovalsImageView.frame.size.height = UI.OvalImageView.height
        ovalsImageView.image = ovalsImage
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        genderField.inputView = genderPickerView
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.layer.borderWidth = 1.0
        
        setContainerLayouts()
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: UI.TitleLabel.heightSmallMultiplier),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    private func setContainerLayouts() {
        scrollView.attachHorizontally(to: view, leadingMargin: 0, trailingMargin: 0)
        scrollView.attachVertically(to: view, topMargin: 0, bottomMargin: 0)
        
        stackView.attachVertically(to: scrollView, topMargin: UI.StackView.marginSmall, bottomMargin: 0)
        stackView.centerHorizontally(with: scrollView)
        
        stackView.addArrangedSubviews([
            titleLabel,
            nameLabel,
            nameField,
            emailLabel,
            emailField,
            passwordLabel,
            passwordField,
            confirmPasswordLabel,
            confirmPasswordField,
            genderLabel,
            genderField,
            signUpButton,
            lineView,
            signInButton
        ])
    }
    
    // HANDLE NAVIGATION AND ACTIONS
    @objc func signInTapped() {
        AppNavigator.shared.navigate(to: OnboardingRoutes.signIn, with: .push)
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
        genderField.text = genders[row]
        genderField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
}
