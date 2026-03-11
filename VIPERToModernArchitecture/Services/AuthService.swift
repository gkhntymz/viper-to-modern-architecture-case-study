//
//  AuthService.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 10.03.2026.
//

import Foundation

protocol AuthService {
    func login(email: String, password: String) async throws -> LoginModels.Response
}

final class DefaultAuthService: AuthService {

    func login(email: String, password: String) async throws -> LoginModels.Response {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        if email == "a@b.com" && password == "x" {
            return LoginModels.Response(
                token: "mock-token",
                userId: "user-123"
            )
        } else {
            throw NSError(
                domain: "Auth",
                code: 401,
                userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"]
            )
        }
    }
}
