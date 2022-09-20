//
//  StackViewExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(
        orientation: NSLayoutConstraint.Axis = .vertical,
        distribution: Distribution = .equalSpacing,
        spacing: CGFloat = UI.StackView.defaultSpacing
    ) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.axis = orientation
        self.distribution = distribution
        self.spacing = spacing
    }
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }
}
