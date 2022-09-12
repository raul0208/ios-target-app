//
//  SignInViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 8/09/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let titleLabel = UILabel(style: .big(text: "TARGET MVD"))
        
    private let emailLabel = UILabel(style: .normal(text: "EMAIL"))
    
    private let emailField = UITextField(
        target: SignInViewController.self,
        placeholder: "Type your email"
    )
    
    private let passwordLabel = UILabel(style: .normal(text: "PASSWORD"))
    
    private let passwordField = UITextField(
        target: SignInViewController.self,
        placeholder: "Type your password",
        isPassword: true
    )
    
    private let signInButton = UIButton(
        style: .primary(title: "SIGN IN")
    )

    private lazy var forgotPasswordButton = UIButton(
        style: .secondary(title: "Forgot your password?")
    )

    private lazy var connectFacebookButton = UIButton(
        style: .secondary(title: "CONNECT WITH FACEBOOK")
    )
    
    private let lineView = UIView()
        
    private let signUpButton = UIButton(
        style: .secondary(title: "SIGN UP")
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
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.layer.borderWidth = 1.0
        
        setContainerLayouts()
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: 0.2
            ),
            lineView.heightAnchor.constraint(equalToConstant: 1),
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
