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
  
  private lazy var mapView: MKMapView = {
    let map = MKMapView()
    map.overrideUserInterfaceStyle = .dark
    map.isZoomEnabled = true
    map.isScrollEnabled = true
    return map
  }()
  
  private let locationManager: LocationManager
  private var subscribers = Set<AnyCancellable>()
  
  init(locationManager: LocationManager) {
    self.locationManager = locationManager
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
    locationManager
      .$lastLocation
      .compactMap { $0 }
      .sink { [weak self] location in
        self?.setMapConfig(withLocation: location)
      }.store(in: &subscribers)
  }
  
  private func setMapConfig(withLocation location: CLLocation) {
    let viewRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: UI.MapRegion.latitudinalMeters,
      longitudinalMeters: UI.MapRegion.longitudinalMeters
    )
    mapView.setRegion(viewRegion, animated: false)
  }
  
  private func setMapConstraints() {
    view.addSubview(mapView)
    
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
  }
}
