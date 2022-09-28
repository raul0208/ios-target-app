//
//  ImageViewExtension.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 20/9/22.
//

import UIKit

extension UIImageView {
  
  convenience init(
    imageResource: String? = nil,
    contentMode: UIView.ContentMode = .scaleAspectFill,
    width: CGFloat = 0,
    height: CGFloat = 0
  ) {
    self.init()
    
    translatesAutoresizingMaskIntoConstraints = false
    
    if let imageResource = imageResource {
      self.image = UIImage(named: imageResource)
    }
    
    self.contentMode = contentMode
    self.frame.size.width = width
    self.frame.size.height = height
  }
}
