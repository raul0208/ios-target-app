//
//  SessionManager.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 23/09/22.
//

import UIKit

internal class SessionManager: CurrentUserSessionProvider {

  static let shared = SessionManager()

  private let userDefaults: UserDefaults

  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
  }

  var currentSession: Session? {
    get {
      if
        let data = userDefaults.data(forKey: "ios-target-session"),
        let session = try? JSONDecoder().decode(Session.self, from: data)
      {
        return session
      }
      return nil
    }
    
    set {
      let session = try? JSONEncoder().encode(newValue)
      userDefaults.set(session, forKey: "ios-target-session")
    }
  }
  
  func deleteSession() {
    userDefaults.removeObject(forKey: "ios-target-session")
  }
  
  var validSession: Bool {
    if let session = currentSession, let uid = session.uid,
       let tkn = session.accessToken, let client = session.client {
      return !uid.isEmpty && !tkn.isEmpty && !client.isEmpty
    }
    return false
  }
}
