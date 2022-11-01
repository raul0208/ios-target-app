//
//  TargetViewModel.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 1/11/22.
//

import Foundation

enum TargetViewModelState {
  case created
  case network(state: NetworkState)
}

final class TargetViewModel {
  
  private let targetServices: TargetServices
  
  init(targetServices: TargetServices = TargetServices()) {
    self.targetServices = targetServices
  }

  @Published private var state: TargetViewModelState = .network(state: .idle)
  var statePublisher: Published<TargetViewModelState>.Publisher { $state }
  
  //TODO: change request parameters to be dynamic
  private let title = "New Target"
  private let latitude = 41.390367
  private let longitude = 11.1528576
  private let radius = 27384.4
  private let topicId = 2
  
  func createTarget() {
    state = .network(state: .loading)
    targetServices.createTarget(
      title: title,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      topicId: topicId
    ) { [weak self] result in
      guard let self = self else { return }
      
      switch result {
      case .success:
        self.state = .created
      case .failure(let error):
        self.state = .network(state: .error(error.localizedDescription))
      }
    }
  }
}
