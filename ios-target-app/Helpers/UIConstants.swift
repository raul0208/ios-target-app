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
    static let lineBorderWidth: CGFloat = 1.0
  }
  
  enum TextField {
    static let height: CGFloat = 55.0
    static let width: CGFloat = 80.0
    static let spacing: CGFloat = 8.0
    static let errorBorderWidth: CGFloat = 2.0
  }
  
  enum Button {
    static let cornerRadius: CGFloat = 0.0
    static let height: CGFloat = 55.0
    static let width: CGFloat = 128.0
    static let spacing: CGFloat = 20.0
    static let enabledAlpha: CGFloat = 1
    static let disabledAlpha: CGFloat = 0.5
  }
  
  enum OvalImageView {
    static let heightBig: CGFloat = 190
    static let heightMedium: CGFloat = 120
  }
  
  enum StackView {
    static let marginBig: CGFloat = 40
    static let marginMedium: CGFloat = 30
    static let marginSmall: CGFloat = 18
    static let defaultSpacing: CGFloat = 10
    static let formSpacing: CGFloat = 15
  }
  
  enum TitleLabel {
    static let heightSmallMultiplier: CGFloat = 0.14
    static let heightBigMultiplier: CGFloat = 0.2
  }
  
  enum MapRegion {
    static let latitudinalMeters: CGFloat = 2000
    static let longitudinalMeters: CGFloat = 2000
  }
  
  enum BottomSheet {
    static let cornerRadius: CGFloat = 20
    static let shadowRadius: CGFloat = 20
    static let defaultTopAnchor: CGFloat = 15
    static let height: CGFloat = 100
  }
}
