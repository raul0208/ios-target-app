//
//  User.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 21/9/22.
//

import Foundation

struct User: Codable {
  var id: Int
  var username: String
  var email: String
  var image: URL?

  private enum CodingKeys: String, CodingKey {
    case id
    case username
    case email
    case image = "profile_picture"
  }
}
