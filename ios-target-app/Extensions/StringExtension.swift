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
  
  func isEmailFormatted() -> Bool {
    let emailRegex = "[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?"
    let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return predicate.evaluate(with: self)
  }
}
