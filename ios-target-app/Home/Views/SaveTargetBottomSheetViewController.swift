//
//  SaveTargetBottomSheetViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 25/10/22.
//

import UIKit

class SaveTargetBottomSheetViewController: UIViewController {
  
  private let viewModel: TargetViewModel
  
  private lazy var areaLabel = UILabel(
    text: "home_area_label".localized,
    size: .normal
  )
  
  private lazy var areaField = UITextField(
    target: self,
    placeholder: "home_area_placeholder".localized
  )
  
  private lazy var targetTitleLabel = UILabel(
    text: "home_target_label".localized,
    size: .normal
  )
  
  private lazy var targetTitleField = UITextField(
    target: self,
    placeholder: "home_target_placeholder".localized
  )
  
  private lazy var topicLabel = UILabel(
    text: "home_topic_label".localized,
    size: .normal
  )
  
  private lazy var topicField = UITextField(
    target: self,
    placeholder: "home_topic_placeholder".localized
  )
  
  private lazy var saveButton = UIButton(
    text: "home_save_button_label".localized,
    target: self,
    action: #selector(saveTargetButtonTapped)
  )
  
  init(viewModel: TargetViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setBottomSheetUIConfigs()
    configureViews()
  }
  
  func setBottomSheetUIConfigs() {
    view.layer.cornerRadius = UI.BottomSheet.cornerRadius
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowRadius = UI.BottomSheet.shadowRadius
    view.layer.shadowOffset = .init(width: 0, height: UI.BottomSheet.shadowHeightOffset)
    view.layer.shadowOpacity = UI.BottomSheet.shadowOpacity
    view.backgroundColor = .white
  }
  
  func configureViews() {
    areaField.keyboardType = .decimalPad
    view.addSubviews([
      areaLabel,
      areaField,
      targetTitleLabel,
      targetTitleField,
      topicLabel,
      topicField,
      saveButton
    ])
    
    [areaField,
     targetTitleField,
     topicField,
    ].forEach {
      $0.attachHorizontally(
        to: view,
        leadingMargin: UI.Defaults.margin,
        trailingMargin: UI.Defaults.margin
      )
    }
    
    saveButton.attachHorizontally(
      to: view,
      leadingMargin: UI.Button.width,
      trailingMargin: UI.Button.width
    )
    
    NSLayoutConstraint.activate([
      areaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      areaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UI.Defaults.margin),
      areaField.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: UI.TextField.spacing),
      targetTitleLabel.topAnchor.constraint(equalTo: areaField.bottomAnchor, constant: UI.Label.spacing),
      targetTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UI.Defaults.margin),
      targetTitleField.topAnchor.constraint(equalTo: targetTitleLabel.bottomAnchor, constant: UI.TextField.spacing),
      topicLabel.topAnchor.constraint(equalTo: targetTitleField.bottomAnchor, constant: UI.Label.spacing),
      topicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UI.Defaults.margin),
      topicField.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: UI.TextField.spacing),
      saveButton.topAnchor.constraint(equalTo: topicField.bottomAnchor, constant: UI.Defaults.margin),
    ])
  }
  
  // MARK: - Actions
  @objc
  func saveTargetButtonTapped() {
    viewModel.createTarget()
  }
}
