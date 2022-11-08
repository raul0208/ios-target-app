//
//  Target.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation

struct Target: Codable {
  let id: Int
  let title: String
  let latitude, longitude, radius: Double
  let topicId: Int
  
  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case latitude, longitude, radius
    case topicId = "topic_id"
  }
}
