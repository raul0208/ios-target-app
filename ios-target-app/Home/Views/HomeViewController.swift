//
//  HomeViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 28/09/22.
//

import UIKit
import MapKit
import Combine

class HomeViewController: UIViewController, MKMapViewDelegate {
  
  private let viewModel: HomeViewModel
  
  private lazy var mapView: MKMapView = {
    let map = MKMapView()
    map.overrideUserInterfaceStyle = .dark
    map.isZoomEnabled = true
    map.isScrollEnabled = true
    return map
  }()
  
  private lazy var createTargetBottomSheetView: UIView = {
    let bottomSheet = CreateTargetBottomSheetView()
    bottomSheet.translatesAutoresizingMaskIntoConstraints = false
    bottomSheet.delegate = self
    return bottomSheet
  }()
  
  private var cancellableSubscriptions = Set<AnyCancellable>()
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    
    setupSubscribers()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setDefaultScreenConfigs()
    setNavigationBar()
    setMapConstraints()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
    mapView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mapView.showsUserLocation = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mapView.showsUserLocation = false
  }
  
  private func setNavigationBar() {
    navigationItem.title = "home_title".localized
    
    let profileButtonIcon = UIBarButtonItem(
      image: UIImage(named: "ic_home_profile"),
      style: .plain,
      target: self,
      action: nil
    )
    
    let chatButtonIcon = UIBarButtonItem(
      image: UIImage(named: "ic_home_chat"),
      style: .plain,
      target: self,
      action: nil
    )
    
    profileButtonIcon.tintColor = .black
    chatButtonIcon.tintColor = .black
    
    navigationItem.leftBarButtonItem = profileButtonIcon
    navigationItem.rightBarButtonItem = chatButtonIcon
  }
  
  private func setupSubscribers() {
    viewModel.currentLocationPublisher
      .receive(on: RunLoop.main)
      .sink { [weak self] location in
        self?.setMapConfig(withLocation: location)
      }.store(in: &cancellableSubscriptions)
  }
  
  private func setMapConfig(withLocation location: CLLocation) {
    let viewRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: UI.MapRegion.latitudinalMeters,
      longitudinalMeters: UI.MapRegion.longitudinalMeters
    )
    mapView.setRegion(viewRegion, animated: false)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = location.coordinate
    mapView.addAnnotation(annotation)
  }
  
  private func setMapConstraints() {
    view.addSubviews([mapView, createTargetBottomSheetView])
    
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    createTargetBottomSheetView.attachHorizontally(to: view, leadingMargin: 0, trailingMargin: 0)
    
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      createTargetBottomSheetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      createTargetBottomSheetView.heightAnchor.constraint(equalToConstant: UI.BottomSheet.height)
    ])
  }
}

extension HomeViewController: BottomSheetDelegate {
  func createTargetButtonTapped() {
    let saveTargetBottomSheetViewController = SaveTargetBottomSheetViewController()
    let navigationController = UINavigationController(rootViewController: saveTargetBottomSheetViewController)
    navigationController.modalPresentationStyle = .pageSheet
    
    if let sheet = navigationController.sheetPresentationController {
      sheet.detents = [.medium()]
    }
    present(navigationController, animated: true, completion: nil)
  }
}
