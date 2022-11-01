//
//  Avatar.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation

struct Avatar: Codable {
  let originalUrl, normalUrl, smallThumbUrl: String?
  
  private enum CodingKeys: String, CodingKey {
    case originalUrl = "original_url"
    case normalUrl = "normal_url"
    case smallThumbUrl = "small_thumb_url"
  }
}
