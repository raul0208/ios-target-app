//
//  User.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 22/9/22.
//

import Foundation

struct User: Codable {
  var id: Int
  var email: String
  var firstName: String
  var lastName: String
  var name: String
  var username: String
  var gender: String
  var avatar: Avatar?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case firstName = "first_name"
    case lastName = "last_name"
    case username
    case email
    case name
    case gender
    case avatar
  }
}
