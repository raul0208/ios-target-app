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
        color: UIColor = .black,
        text: String = "",
        textColor: UIColor = .white,
        cornerRadius: CGFloat = UI.Button.cornerRadius,
        height: CGFloat = UI.Button.height,
        actionHandler: (target: Any, action: Selector)? = nil
    ) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let action = actionHandler?.action {
            addTarget(actionHandler?.target, action: action, for: .touchUpInside)
        }
        
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        backgroundColor = color
        setRoundBorders(cornerRadius)
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
