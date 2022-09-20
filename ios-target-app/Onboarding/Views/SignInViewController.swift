//
//  SignInViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 8/09/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var ovalsImageView = UIImageView(imageResource: "ovalsGroup", height: UI.OvalImageView.heightBig)
    
    private lazy var titleLabel = UILabel(
        text: "general_target_title".localized,
        size: .big,
        isBold: true
    )
        
    private lazy var emailLabel = UILabel(
        text: "email_label".localized,
        size: .normal
    )
    
    private lazy var emailField = UITextField(
        target: self,
        placeholder: "sign_in_email_placeholder".localized
    )
    
    private lazy var passwordLabel = UILabel(
        text: "password_label".localized,
        size: .normal
    )
    
    private lazy var passwordField = UITextField(
        target: self,
        placeholder: "sign_in_password_placeholder".localized,
        isPassword: true
    )
    
    private lazy var signInButton = UIButton(text: "sign_in_button".localized)

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
    
    private lazy var lineView = UIView()
        
    private lazy var signUpButton = UIButton(
        color: .clear,
        text: "sign_up_button".localized,
        textColor: .black,
        target: self,
        action: #selector(signUpTapped)
    )
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
    private lazy var stackView = UIStackView(
        orientation: .vertical,
        distribution: .equalSpacing,
        spacing: UI.StackView.formSpacing
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setViews() {
        view.addSubviews([ovalsImageView, scrollView])
        view.backgroundColor = .white
        scrollView.addSubview(stackView)
        lineView.setToLineView()
        
        setContainerLayouts()
    }
    
    private func setContainerLayouts() {
        scrollView.attachHorizontally(to: view, leadingMargin: 0, trailingMargin: 0)
        scrollView.attachVertically(to: view, topMargin: 0, bottomMargin: 0)
        
        stackView.attachVertically(to: scrollView, topMargin: UI.StackView.marginBig, bottomMargin: 0)
        stackView.centerHorizontally(with: scrollView)
        
        ovalsImageView.attachHorizontally(to: view, leadingMargin: 0, trailingMargin: 0)
        
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
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: UI.TitleLabel.heightBigMultiplier),
            lineView.heightAnchor.constraint(equalToConstant: UI.Defaults.lineBorderWidth)
        ])
    }
    
    // HANDLE NAVIGATION AND ACTIONS
    @objc func signUpTapped() {
        AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
    }
}
