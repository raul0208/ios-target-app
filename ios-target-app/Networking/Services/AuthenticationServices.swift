//
//  AuthenticationServices.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 23/09/22.
//

import Foundation
import UIKit
import RSSwiftNetworking

internal class AuthenticationServices {
    
    enum AuthError: Error {
        case userSessionInvalid
    }
    
    private let apiClient: APIClient
    
    init(
        apiClient: APIClient = iOSBaseAPIClient.shared
    ) {
        self.apiClient = apiClient
    }
    
    func signup(
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
                password: password,
                passwordConfirmation: password
            )
        ) { (result: Result<UserResponse?, Error>, responseHeaders) in
            switch result {
            case .success(let userResponse):
                if let user = userResponse?.user {
                    completion(.success(user))
                } else {
                    completion(.failure(AuthError.userSessionInvalid))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
