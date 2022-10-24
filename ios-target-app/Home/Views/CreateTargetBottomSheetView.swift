//
//  CreateTargetBottomSheetView.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 24/10/22.
//

import UIKit

protocol BottomSheetDelegate: AnyObject {
  func createTargetButtonTapped()
}

final class CreateTargetBottomSheetView: UIView {
  
  private lazy var targetImageView = UIImageView(imageResource: "ic_target")
  
  private lazy var createTargetButton = UIButton(
    color: .clear,
    text: "home_create_target_button_label".localized,
    textColor: .black,
    target: self,
    action: #selector(createNewTargetTapped)
  )
  
  weak var delegate: BottomSheetDelegate?
  
  init() {
    super.init(frame: .zero)
    
    addSubviews([
      targetImageView,
      createTargetButton
    ])
    
    layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    layer.cornerRadius = UI.BottomSheet.cornerRadius
    layer.shadowRadius = UI.BottomSheet.shadowRadius
    backgroundColor = .white
    
    targetImageView.centerHorizontally(with: self)
    createTargetButton.centerHorizontally(with: self)
    
    NSLayoutConstraint.activate([
      targetImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: UI.BottomSheet.defaultTopAnchor),
      createTargetButton.topAnchor.constraint(equalTo: targetImageView.bottomAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Actions
  
  @objc func createNewTargetTapped(_ sender: Any) {
    delegate?.createTargetButtonTapped()
  }
}
