//
//  OnboardingRoutes.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 14/09/22.
//

import Foundation
import UIKit

enum OnboardingRoutes: Route {
  case signIn
  case signUp

  var screen: UIViewController {
    switch self {
    case .signIn:
      return SignInViewController()
    case .signUp:
      return SignUpViewController(viewModel: SignUpViewModel())
    }
  }
}
