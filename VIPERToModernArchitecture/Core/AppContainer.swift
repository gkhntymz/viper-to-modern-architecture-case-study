//
//  AppContainer.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 11.03.2026.
//

import Foundation

final class AppContainer {
    let authService: AuthService

    init(authService: AuthService = DefaultAuthService()) {
        self.authService = authService
    }
}
