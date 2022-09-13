//
//  StringExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 12/09/22.
//

import Foundation

extension String {

  var localized: String {
    self.localize()
  }
    
  func localize(comment: String = "") -> String {
    NSLocalizedString(self, comment: comment)
  }
}
