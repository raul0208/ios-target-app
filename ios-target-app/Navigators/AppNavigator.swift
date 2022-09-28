//
//  AppNavigator.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 14/09/22.
//

import Foundation

class AppNavigator: BaseNavigator {
  static let shared = AppNavigator()

  init() {
    super.init(with: OnboardingRoutes.signIn)
  }

  required init(with route: Route) {
    super.init(with: route)
  }
}
