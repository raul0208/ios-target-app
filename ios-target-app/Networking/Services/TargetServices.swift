//
//  TargetServices.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation
import RSSwiftNetworking

internal class TargetServices {
  
  enum TargetError: Error {
    case targetInvalid
  }
  
  private let apiClient: APIClient
  
  init(apiClient: APIClient = iOSBaseAPIClient.shared) {
    self.apiClient = apiClient
  }
  
  func createTarget(
    title: String,
    latitude: Double,
    longitude: Double,
    radius: Double,
    topicId: Int,
    completion: @escaping (Result<TargetRaw, Error>) -> Void
  ) {
    apiClient.request(
      endpoint: TargetEndpoint.createTarget(
        title: title,
        latitude: latitude,
        longitude: longitude,
        radius: radius,
        topicId: topicId
      )
    ) { (result: Result<TargetResponse?, Error>, responseHeaders) in
      switch result {
      case .success(let targetResponse):
        if let target = targetResponse?.target {
          completion(.success(target))
        } else {
          completion(.failure(TargetError.targetInvalid))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
