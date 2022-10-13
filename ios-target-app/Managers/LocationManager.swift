//
//  LocationManager.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 13/10/22.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
  
  static let instance = LocationManager()
  private var locationManager: CLLocationManager = CLLocationManager()
  
  @Published var lastLocation: CLLocation?
  
  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    
    if CLLocationManager.locationServicesEnabled() { // Check for Location Services
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      lastLocation = location
    }
  }
}
