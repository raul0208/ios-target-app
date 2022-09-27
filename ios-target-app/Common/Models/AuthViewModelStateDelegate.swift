//
//  AuthViewModelStateDelegate.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 22/9/22.
//

import Foundation
import UIKit

protocol NetworkStatusDelegate: AnyObject {
  func networkStatusChanged(to networkStatus: NetworkState)
}

protocol AuthViewModelStateDelegate: NetworkStatusDelegate {
  func didUpdateState(to state: AuthViewModelState)
}
