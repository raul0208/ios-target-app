//
//  HomeViewController.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 28/09/22.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
  
  private lazy var mapView: MKMapView = {
    let map = MKMapView()
    map.overrideUserInterfaceStyle = .dark
    return map
  }()
  
  private var locationManager: CLLocationManager!
  private var currentLocation: CLLocation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setDefaultScreenConfigs()
    setNavigationBar()
    setMapConstraints()
    setMapConfig()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
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
  
  private func setMapConfig() {
    mapView.delegate = self
    
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    
    // Check for Location Services
    if CLLocationManager.locationServicesEnabled() {
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    defer { currentLocation = locations.last }
    
    if currentLocation == nil {
      // Zoom to user location
      if let userLocation = locations.last {
        let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(viewRegion, animated: false)
      }
    }
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
