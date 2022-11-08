//
//  TargetResponse.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation

// MARK: - Target Response
struct TargetResponse: Codable {
  let target: TargetRaw
  let matchConversation: MatchConversation?
  let matchedUser: MatchedUser?
  
  enum CodingKeys: String, CodingKey {
    case target
    case matchConversation = "match_conversation"
    case matchedUser = "matched_user"
  }
}

// MARK: Target Raw
struct TargetRaw: Codable {
  let id: Int
  let title: String
  let lat, lng, radius: Double
  let topic: Topic
  
  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case lat, lng, radius
    case topic
  }
}

// MARK: Topic
struct Topic: Codable {
  let id: Int
  let icon, label: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case icon, label
  }
}

// MARK: - Match Conversation
struct MatchConversation: Codable {
  let id, topicId: Int
  
  private enum CodingKeys: String, CodingKey {
    case id
    case topicId = "topic_id"
  }
}

// MARK: - Matched User
struct MatchedUser: Codable {
  let id: Int
  let email, firstName, lastName, fullName, username, gender: String
  let avatar: Avatar
  
  private enum CodingKeys: String, CodingKey {
    case id, email
    case firstName = "first_name"
    case lastName = "last_name"
    case fullName = "full_name"
    case username, gender, avatar
  }
}
