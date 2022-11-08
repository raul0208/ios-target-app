//
//  AuthenticationServices.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 23/09/22.
//

import Foundation
import RSSwiftNetworking

internal class AuthenticationServices {
  
  enum AuthError: Error {
    case userSessionInvalid
  }
  
  private let sessionManager: SessionManager
  private let apiClient: APIClient
  
  init(
    sessionManager: SessionManager = .shared,
    apiClient: APIClient = iOSBaseAPIClient.shared
  ) {
    self.sessionManager = sessionManager
    self.apiClient = apiClient
  }
  
  func signUp(
    name: String,
    email: String,
    gender: String,
    password: String,
    completion: @escaping (Result<User, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.signUp(
        firstName: name,
        lastName: name,
        username: name,
        email: email,
        gender: gender,
        password: password
      )
    ) { (result: Result<UserResponse?, Error>, responseHeaders) in
      switch result {
      case .success(let userResponse):
        if
          let user = userResponse?.user,
          self.saveUserSession(userResponse?.user, headers: responseHeaders)
        {
          completion(.success(user))
        } else {
          completion(.failure(AuthError.userSessionInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  func signIn(
    email: String,
    password: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: AuthEndpoint.signIn(
        email: email,
        password: password
      )
    ) { (result: Result<UserResponse?, Error>, responseHeaders) in
      switch result {
      case .success(let userResponse):
        if self.saveUserSession(userResponse?.user, headers: responseHeaders) {
          completion(.success(()))
        } else {
          completion(.failure(AuthError.userSessionInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  private func saveUserSession(
    _ user: User?,
    headers: [AnyHashable: Any]
  ) -> Bool {
    UserDataManager.currentUser = user
    sessionManager.currentSession = Session(headers: headers)
    
    return UserDataManager.currentUser != nil && sessionManager.validSession
  }
}
