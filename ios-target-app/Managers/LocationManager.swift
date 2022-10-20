//
//  LocationManager.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 13/10/22.
//

import UIKit
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
  
  static let instance = LocationManager()
  private let locationManager: CLLocationManager = CLLocationManager()
  
  @Published var lastLocation: CLLocation?
  
  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if CLLocationManager.locationServicesEnabled() {
      switch manager.authorizationStatus {
      case .authorizedAlways, .authorizedWhenInUse:
        locationManager.startUpdatingLocation()
        break
      case .restricted, .denied:
        locationManager.stopUpdatingLocation()
        break
      case .notDetermined:
        manager.requestWhenInUseAuthorization()
        break
      default:
        break
      }
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      lastLocation = location
    }
  }
}
