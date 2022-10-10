//
//  SignInViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 8/09/22.
//

import Combine
import UIKit

class SignInViewController: UIViewController {
  
  // MARK: - ViewModels
  private let viewModel: SignInViewModel
  
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
    selector: #selector(formEditingChange),
    placeholder: "sign_in_email_placeholder".localized
  )
  
  private lazy var passwordLabel = UILabel(
    text: "password_label".localized,
    size: .normal
  )
  
  private lazy var passwordField = UITextField(
    target: self,
    selector: #selector(formEditingChange),
    placeholder: "sign_in_password_placeholder".localized,
    isPassword: true
  )
  
  private lazy var credentialsErrorLabel = UILabel(
    text: "sign_in_error_label".localized,
    textColor: .error,
    size: .small
  )
  
  private lazy var signInButton = UIButton(
    text: "sign_in_button".localized,
    target: self,
    action: #selector(signInButtonTapped)
  )
  
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
  
  init(viewModel: SignInViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    
    setupSubscribers()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setViews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  // MARK: - Subscribers
  private var subscribers: Set<AnyCancellable> = []
  
  private func setupSubscribers() {
    viewModel.statePublisher
      .receive(on: RunLoop.main)
      .sink { [weak self] state in
        self?.setViewsState(state: state)
      }.store(in: &subscribers)
    
    viewModel.isSignInEnabledPublisher
      .receive(on: RunLoop.main)
      .sink { [weak self] isButtonEnabled in
        self?.setSignInButton(enabled: isButtonEnabled)
      }.store(in: &subscribers)
  }
  
  private func setViewsState(state: AuthViewModelState) {
    switch state {
    case .loggedIn: break
      // TODO: add action
    case .network(state: let state):
      switch state {
      case .idle: break
        // TODO: add action
      case .loading: break
        // TODO: add action
      case .error(_):
        setErrorStateToViews()
      }
    }
  }
  
  // MARK: - Views configurations
  private func setViews() {
    view.addSubviews([ovalsImageView, scrollView])
    view.backgroundColor = .white
    scrollView.addSubview(stackView)
    lineView.setToLineView()
    credentialsErrorLabel.isHidden = true
    
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
      credentialsErrorLabel,
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
  
  private func setErrorStateToViews() {
    credentialsErrorLabel.isHidden = false
    emailField.layer.borderColor = UIColor.error.cgColor
    emailField.layer.borderWidth = UI.TextField.errorBorderWidth
    passwordField.layer.borderColor = UIColor.error.cgColor
    passwordField.layer.borderWidth = UI.TextField.errorBorderWidth
  }
  
  func setSignInButton(enabled: Bool) {
    signInButton.alpha = enabled ? UI.Button.enabledAlpha : UI.Button.disabledAlpha
    signInButton.isEnabled = enabled
  }
  
  // MARK: - Navigation and Actions
  @objc func signInButtonTapped() {
    viewModel.signIn()
  }
  
  @objc func signUpTapped() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
  }
  
  @objc func formEditingChange(_ sender: UITextField) {
    let newValue = sender.text ?? ""
    switch sender {
    case emailField:
      viewModel.fieldChanged(field: .email, value: newValue)
    case passwordField:
      viewModel.fieldChanged(field: .password, value: newValue)
    default: break
    }
  }
}
