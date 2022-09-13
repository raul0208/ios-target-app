//
//  SignInViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 8/09/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let titleLabel = UILabel(style: .big(text: "general_target_title".localized))
        
    private let emailLabel = UILabel(style: .normal(text: "email_label".localized))
    
    private let emailField = UITextField(
        target: SignInViewController.self,
        placeholder: "sign_in_email_placeholder".localized
    )
    
    private let passwordLabel = UILabel(style: .normal(text: "password_label".localized))
    
    private let passwordField = UITextField(
        target: SignInViewController.self,
        placeholder: "sign_in_password_placeholder".localized,
        isPassword: true
    )
    
    private let signInButton = UIButton(
        style: .primary(title: "sign_in_button".localized)
    )

    private lazy var forgotPasswordButton = UIButton(
        style: .secondary(title: "sign_in_forgot_password".localized)
    )

    private lazy var connectFacebookButton = UIButton(
        style: .secondary(title: "sign_in_connect_facebook".localized)
    )
    
    private let lineView = UIView()
        
    private let signUpButton = UIButton(
        style: .secondary(title: "sign_up_button".localized)
    )
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private let stackView: UIStackView = {
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
    
    private func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.layer.borderColor = UIColor.lightGray.cgColor
        lineView.layer.borderWidth = 1.0
        
        setContainerLayouts()
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: 0.2
            ),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setContainerLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(subviews: [
            titleLabel,
            emailLabel,
            emailField,
            passwordLabel,
            passwordField,
            signInButton,
            forgotPasswordButton,
            connectFacebookButton,
            lineView,
            signUpButton
        ])
    }

}
