//
//  TargetEndpoint.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation
import RSSwiftNetworking

internal enum TargetEndpoint: RailsAPIEndpoint {
  
  case createTarget(
    title: String,
    latitude: Double,
    longitude: Double,
    radius: Double,
    topicId: Int
  )
  
  private static let targetsUrl = "/targets/"
  
  var path: String {
    switch self {
    case .createTarget:
      return TargetEndpoint.targetsUrl
    }
  }
    
  var method: Network.HTTPMethod {
    switch self {
    case .createTarget:
      return .post
    }
  }
  
  var parameters: [String: Any] {
    switch self {
    case .createTarget(
      let title,
      let latitude,
      let longitude,
      let radius,
      let topicId
    ):
      let parameters = [
        "title": title,
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "topic_id": topicId
      ] as [String : Any]
      return ["target": parameters]
    }
  }
}
