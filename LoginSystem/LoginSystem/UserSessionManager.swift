//
//  UserSessionManager.swift
//  LoginSystem
//
//  Created by nika razmadze on 02.08.25.
//

import Foundation

// MARK: - Keys
private enum SessionKey: String {
    case email
    case isLoggedIn
}

// MARK: - Manager
final class UserSessionManager {
    static let shared = UserSessionManager()      
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    var email: String? {
        get { defaults.string(forKey: SessionKey.email.rawValue) }
        set { defaults.setValue(newValue, forKey: SessionKey.email.rawValue) }
    }
    
    var isLoggedIn: Bool {
        get { defaults.bool(forKey: SessionKey.isLoggedIn.rawValue) }
        set { defaults.setValue(newValue, forKey: SessionKey.isLoggedIn.rawValue) }
    }
    
    func startSession(email: String) {
        self.email = email
        isLoggedIn    = true
    }
    
    func endSession() {
        defaults.removeObject(forKey: SessionKey.email.rawValue)
        defaults.removeObject(forKey: SessionKey.isLoggedIn.rawValue)
        defaults.synchronize()
    }
}
