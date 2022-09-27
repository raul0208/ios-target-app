//
//  AuthEndpoint.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 23/09/22.
//

import Foundation
import RSSwiftNetworking

internal enum AuthEndpoint: RailsAPIEndpoint {
    
    case signUp(
        firstName: String,
        lastName: String,
        username: String,
        email: String,
        gender: String,
        password: String,
        passwordConfirmation: String
    )
    
    private static let usersURL = "/users/"
    
    var path: String {
        switch self {
        case .signUp:
            return AuthEndpoint.usersURL
        }
    }
    
    var method: Network.HTTPMethod {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .signUp(
            let firstName,
            let lastName,
            let username,
            let email,
            let gender,
            let password,
            let passwordConfirmation
        ):
            let parameters = [
                "first_name": firstName,
                "last_name": lastName,
                "username": username,
                "email": email,
                "gender": gender,
                "password": password,
                "password_confirmation": passwordConfirmation
            ]
            return ["user": parameters]
        }
    }
}
