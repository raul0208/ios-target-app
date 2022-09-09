//
//  ViewExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import UIKit

extension UIView {
    func addSubviews(subviews: [UIView]) {
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
}
