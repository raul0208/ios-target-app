//
//  StackViewExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubview(subviews: [UIView]) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }
}
