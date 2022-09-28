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

struct Avatar: Codable {
  var originalUrl: String?
  var normalUrl: String?
  var smallThumbUrl: String?
  
  private enum CodingKeys: String, CodingKey {
    case originalUrl = "original_url"
    case normalUrl = "normal_url"
    case smallThumbUrl = "small_thumb_url"
  }
}

struct UserResponse: Decodable {
  var user: User
}
