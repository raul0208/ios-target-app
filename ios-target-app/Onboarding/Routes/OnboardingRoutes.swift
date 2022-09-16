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
      return buildSignInViewController()
    case .signUp:
      return buildSignUpViewController()
    }
  }

  private func buildSignInViewController() -> UIViewController {
    let signIn = SignInViewController()
    return signIn
  }

  private func buildSignUpViewController() -> UIViewController {
    let signUp = SignUpViewController()
    return signUp
  }
}
