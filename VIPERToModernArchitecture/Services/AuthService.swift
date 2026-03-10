//
//  AuthService.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 10.03.2026.
//

import Foundation

protocol AuthService {
    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginEntity.Response, Error>) -> Void
    )
}

final class DefaultAuthService: AuthService {
    func login(email: String, password: String, completion: @escaping (Result<LoginEntity.Response, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if email == "test@test.com" && password == "123456" {
                completion(.success(LoginEntity.Response(
                    token: "mock-token",
                    userId: "user-123"
                )))
            } else {
                completion(.failure(NSError(
                    domain: "Auth",
                    code: 401,
                    userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"]
                )))
            }
        }
    }
}
