//
//  LabelExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 9/09/22.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(
        text: String = "",
        textColor: UIColor = .black,
        backgroundColor: UIColor = .clear,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .center,
        size: LabelSize = .normal,
        isBold: Bool = false
    ) {
        self.init()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        
        if isBold {
            self.font = UIFont.boldSystemFont(ofSize: size.rawValue)
        } else {
            self.font = self.font.withSize(size.rawValue)
        }
    }
}

enum LabelSize: CGFloat {
    case big = 25
    case normal = 17
    case medium = 15
    case small = 13
}
