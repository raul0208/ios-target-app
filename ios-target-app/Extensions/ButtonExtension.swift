//
//  ButtonExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(
        style: ButtonStyle,
        actionHandler: (target: Any, action: Selector)? = nil
    ) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let action = actionHandler?.action {
            addTarget(actionHandler?.target, action: action, for: .touchUpInside)
        }
        
        switch style {
        case .primary(let color, let title, let titleColor, let cornerRadius, let height):
            setTitle(title, for: .normal)
            setTitleColor(titleColor, for: .normal)
            backgroundColor = color
            setRoundBorders(cornerRadius)
            heightAnchor.constraint(equalToConstant: height).isActive = true
        case .secondary(let color, let title, let titleColor, let cornerRadius, let height):
            setTitle(title, for: .normal)
            setTitleColor(titleColor, for: .normal)
            backgroundColor = color
            setRoundBorders(cornerRadius)
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

enum ButtonStyle {
    case primary (
        color: UIColor = .black,
        title: String = "",
        titleColor: UIColor = .white,
        cornerRadius: CGFloat = UI.Button.cornerRadius,
        height: CGFloat = UI.Button.height
    )
    case secondary (
        color: UIColor = .white,
        title: String = "",
        titleColor: UIColor = .black,
        cornerRadius: CGFloat = UI.Button.cornerRadius,
        height: CGFloat = UI.Button.height
    )
}
