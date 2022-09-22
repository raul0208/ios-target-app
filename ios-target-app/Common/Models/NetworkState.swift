//
//  NetworkState.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 21/9/22.
//

import Foundation

enum NetworkState: Equatable {
  case idle, loading, error(_ error: String)
}
