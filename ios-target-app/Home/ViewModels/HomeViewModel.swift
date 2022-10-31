//
//  HomeViewModel.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 18/10/22.
//

import Foundation
import Combine
import CoreLocation

final class HomeViewModel {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let locationManager: LocationManager
  
  init(locationManager: LocationManager = LocationManager.instance) {
    self.locationManager = locationManager
  }
  
  var currentLocationPublisher: Published<CLLocation>.Publisher { locationManager.$lastLocation }
}
