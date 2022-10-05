//
//  SignInViewModel.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 28/09/22.
//

import Foundation
import UIKit

protocol SignInViewModelDelegate: AuthViewModelStateDelegate {
  func formDidChange()
}

enum SignInField {
  case email
  case password
}

class SignInViewModel {
  
  private let authServices: AuthenticationServices
  
  init(authServices: AuthenticationServices = AuthenticationServices()) {
    self.authServices = authServices
  }
  
  @Published private var state: AuthViewModelState = .network(state: .idle)
  
  var statePublisher: Published<AuthViewModelState>.Publisher { $state }
  
  @Published private var isSignInEnabled: Bool = false
  
  var isSignInEnabledPublisher: Published<Bool>.Publisher { $isSignInEnabled }
  
  weak var delegate: SignInViewModelDelegate?
  
  var email = "" {
    didSet {
      delegate?.formDidChange()
    }
  }
  
  var password = "" {
    didSet {
      delegate?.formDidChange()
    }
  }
  
  var hasValidCredentials: Bool {
    email.isEmailFormatted() && !password.isEmpty
  }
  
  func signIn() {
    state = .network(state: .loading)
    authServices.signIn(
      email: email,
      password: password
    ) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success:
        self.state = .loggedIn
        AppNavigator.shared.navigate(to: HomeRoutes.home, with: .changeRoot)
      case .failure(let error):
        self.state = .network(state: .error(error.localizedDescription))
      }
    }
  }
  
  func fieldChanged(field: SignInField, value: String) {
    switch field {
    case .email:
      self.email = value
      self.isSignInEnabled = hasValidCredentials
    case .password:
      self.password = value
      self.isSignInEnabled = hasValidCredentials
    }
  }
}
