//
//  UIConstants.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

struct UI {
    enum Defaults {
        static let margin: CGFloat = 32
    }
    
    enum TextField {
        static let height: CGFloat = 55.0
        static let width: CGFloat = 80.0
        static let spacing: CGFloat = 8.0
    }
    
    enum Button {
        static let cornerRadius: CGFloat = 0.0
        static let height: CGFloat = 55.0
        static let width: CGFloat = 128.0
        static let spacing: CGFloat = 20.0
    }
    
    enum OvalImageView {
        static let height: CGFloat = 190
    }
    
    enum StackView {
        static let marginBig: CGFloat = 40
        static let marginMedium: CGFloat = 30
        static let marginSmall: CGFloat = 18
    }
    
    enum TitleLabel {
        static let heightSmallMultiplier: CGFloat = 0.14
        static let heightBigMultiplier: CGFloat = 0.2
    }
}
