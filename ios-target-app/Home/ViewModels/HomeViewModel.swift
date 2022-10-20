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
    
    setupSubscribers()
  }
  
  @Published private var currentLocation: CLLocation = CLLocation()
  var currentLocationPublisher: Published<CLLocation>.Publisher { $currentLocation }
  
  private func setupSubscribers() {
    self.locationManager
      .$lastLocation
      .compactMap { $0 }
      .sink { [weak self] location in
        self?.currentLocation = location
      }.store(in: &cancellables)
  }
}
