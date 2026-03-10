//
//  AuthService.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 10.03.2026.
//

import Foundation

protocol AuthService {
    func login(email: String, password: String) async throws -> LoginEntity.Response
}

final class DefaultAuthService: AuthService {

    func login(email: String, password: String) async throws -> LoginEntity.Response {
        try await Task.sleep(nanoseconds: 1_000_000_000)

        if email == "test@test.com" && password == "123456" {
            return LoginEntity.Response(
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
