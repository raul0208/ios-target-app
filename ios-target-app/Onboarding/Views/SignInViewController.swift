//
//  SignInViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 8/09/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var ovalsImageView = UIImageView()
    
    private let titleLabel = UILabel(
        text: "general_target_title".localized,
        size: .big,
        isBold: true
    )
        
    private let emailLabel = UILabel(
        text: "email_label".localized,
        size: .normal
    )
    
    private let emailField = UITextField(
        target: SignInViewController.self,
        placeholder: "sign_in_email_placeholder".localized
    )
    
    private let passwordLabel = UILabel(
        text: "password_label".localized,
        size: .normal
    )
    
    private let passwordField = UITextField(
        target: SignInViewController.self,
        placeholder: "sign_in_password_placeholder".localized,
        isPassword: true
    )
    
    private let signInButton = UIButton(text: "sign_in_button".localized)

    private lazy var forgotPasswordButton = UIButton(
        color: .clear,
        text: "sign_in_forgot_password".localized,
        textColor: .black
    )

    private lazy var connectFacebookButton = UIButton(
        color: .clear,
        text: "sign_in_connect_facebook".localized,
        textColor: .black
    )
    
    private let lineView = UIView()
        
    private lazy var signUpButton = UIButton(
        color: .clear,
        text: "sign_up_button".localized,
        textColor: .black,
        target: self,
        action: #selector(signUpTapped)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.layer.borderColor = UIColor.black.cgColor
        lineView.layer.borderWidth = 1.0
        
        setContainerLayouts()
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: UI.TitleLabel.heightBigMultiplier),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setContainerLayouts() {
        scrollView.attachHorizontally(to: view, leadingMargin: 0, trailingMargin: 0)
        scrollView.attachVertically(to: view, topMargin: 0, bottomMargin: 0)
        
        stackView.attachVertically(to: scrollView, topMargin: UI.StackView.marginBig, bottomMargin: 0)
        stackView.centerHorizontally(with: scrollView)
        
        stackView.addArrangedSubviews([
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
    
    // HANDLE NAVIGATION AND ACTIONS
    @objc func signUpTapped() {
        AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
    }
}
