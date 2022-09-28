//
//  HomeRoutes.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 28/09/22.
//

import Foundation
import UIKit

enum HomeRoutes: Route {
  case home

  var screen: UIViewController {
    switch self {
    case .home:
      return HomeViewController()
    }
  }
}
