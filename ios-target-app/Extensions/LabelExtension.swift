//
//  LabelExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(style: LabelStyle) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch style {
        case .big(let text, let textColor, let backgroundColor, let numberOfLines, let textAlignment, let fontSize):
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.textAlignment = textAlignment
            self.font = UIFont.boldSystemFont(ofSize: fontSize)
        case .normal(let text, let textColor, let backgroundColor, let numberOfLines, let textAlignment, let fontSize):
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.textAlignment = textAlignment
            self.font = self.font.withSize(fontSize)
        case .medium(let text, let textColor, let backgroundColor, let numberOfLines, let textAlignment, let fontSize):
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.textAlignment = textAlignment
            self.font = self.font.withSize(fontSize)
        case .small(let text, let textColor, let backgroundColor, let numberOfLines, let textAlignment, let fontSize):
            self.text = text
            self.textColor = textColor
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.textAlignment = textAlignment
            self.font = self.font.withSize(fontSize)
        }
    }
}

enum LabelStyle {
    case big (
        text: String = "",
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .center,
        fontSize: CGFloat = 25
    )
    case normal (
        text: String = "",
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .center,
        fontSize: CGFloat = 17
    )
    case medium (
        text: String = "",
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .center,
        fontSize: CGFloat = 15
    )
    case small (
        text: String = "",
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .center,
        fontSize: CGFloat = 13
    )
}
