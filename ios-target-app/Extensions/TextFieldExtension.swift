//
//  TextFieldExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import UIKit

extension UITextField {
    convenience init(
        target: Any,
        selector: Selector? = nil,
        placeholder: String = "",
        backgroundColor: UIColor = .white,
        height: CGFloat = UI.TextField.height,
        borderStyle: BorderStyle = .line,
        isPassword: Bool = false
    ){
        self.init()
            
        translatesAutoresizingMaskIntoConstraints = false
        if let selector = selector {
            addTarget(target, action: selector, for: .editingChanged)
        }
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
        self.borderStyle = borderStyle
        heightAnchor.constraint(equalToConstant: height).isActive = true
        isSecureTextEntry = isPassword
    }
}
