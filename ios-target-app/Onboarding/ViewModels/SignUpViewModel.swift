//
//  SignUpViewModel.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 23/09/22.
//

import Foundation
import UIKit

protocol SignUpViewModelDelegate: AuthViewModelStateDelegate {
    func formDidChange()
}

enum AuthViewModelState {
    case loggedIn
    case network(state: NetworkState)
}

class SignUpViewModel {
    
    private let authServices: AuthenticationServices
    
    init(authServices: AuthenticationServices = AuthenticationServices()) {
        self.authServices = authServices
    }
    
    private var state: AuthViewModelState = .network(state: .idle) {
        didSet {
            delegate?.didUpdateState(to: state)
        }
    }
    
    weak var delegate: SignUpViewModelDelegate?
    
    var name = "" {
        didSet {
            delegate?.formDidChange()
        }
    }
    
    var email = "" {
        didSet {
            delegate?.formDidChange()
        }
    }
    
    var gender = "" {
        didSet {
            gender = gender.lowercased()
            delegate?.formDidChange()
        }
    }
    
    var password = "" {
        didSet {
            delegate?.formDidChange()
        }
    }
    
    var passwordConfirmation = "" {
        didSet {
            delegate?.formDidChange()
        }
    }
    
    var hasValidData: Bool {
        email.isEmailFormatted() && !gender.isEmpty && !password.isEmpty && password == passwordConfirmation
    }
    
    func signup() {
        state = .network(state: .loading)
        authServices.signup(
            name: name,
            email: email,
            gender: gender,
            password: password
        ) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.state = .loggedIn
                AppNavigator.shared.navigate(to: OnboardingRoutes.signIn, with: .push)
            case .failure(let error):
                self.state = .network(state: .error(error.localizedDescription))
            }
        }
    }
}
