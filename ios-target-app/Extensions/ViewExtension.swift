//
//  ViewExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import UIKit

extension UIView {
  func addSubviews(_ subviews: [UIView]) {
    for subview in subviews {
      addSubview(subview)
    }
  }
  
  func attachHorizontally(
    to view: UIView,
    leadingMargin: CGFloat = UI.Defaults.margin,
    trailingMargin: CGFloat = UI.Defaults.margin
  ) {
    NSLayoutConstraint.activate([
      leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
      trailingAnchor.constraint(
        equalTo: view.trailingAnchor,
        constant: -trailingMargin
      )
    ])
  }
  
  func attachVertically(
    to view: UIView,
    topMargin: CGFloat = UI.Defaults.margin,
    bottomMargin: CGFloat = UI.Defaults.margin
  ) {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor, constant: topMargin),
      bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomMargin)
    ])
  }
  
  func setRoundBorders(_ cornerRadius: CGFloat = 10.0) {
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
  }
  
  func centerVertically(
    with view: UIView,
    withOffset offset: CGFloat = 0
  ) {
    centerYAnchor.constraint(
      equalTo: view.centerYAnchor,
      constant: offset
    ).isActive = true
  }
  
  func centerHorizontally(
    with view: UIView,
    withOffset offset: CGFloat = 0
  ) {
    centerXAnchor.constraint(
      equalTo: view.centerXAnchor,
      constant: offset
    ).isActive = true
  }
  
  func setToLineView(borderColor: CGColor = UIColor.black.cgColor, borderWidth: CGFloat = UI.Defaults.lineBorderWidth) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.layer.borderColor = borderColor
    self.layer.borderWidth = borderWidth
  }
  
  func setRoundedCornersConfig(
    backgroundColor: UIColor? = .white,
    cornerRadius: CGFloat,
    maskedCorners: CACornerMask,
    shadowColor: CGColor? = UIColor.black.cgColor,
    shadowRadius: CGFloat,
    shadowOffset: CGSize,
    shadowOpacity: Float
  ) {
    self.backgroundColor = backgroundColor
    self.layer.cornerRadius = cornerRadius
    self.layer.maskedCorners = maskedCorners
    self.layer.shadowColor = shadowColor
    self.layer.shadowRadius = shadowRadius
    self.layer.shadowOffset = shadowOffset
    self.layer.shadowOpacity = shadowOpacity
  }
}
