//
//  LoginInterector.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import Foundation

final class LoginInteractor: LoginContracts.Interactor {

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }

    func login(email: String, password: String) async throws -> LoginEntity.Response {
        try await authService.login(email: email, password: password)
    }
}
