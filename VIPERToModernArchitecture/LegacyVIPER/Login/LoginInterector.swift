//
//  LoginInterector.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import Foundation

final class LoginInteractor: LoginContracts.Interactor {

    enum LoginError: LocalizedError {
        case invalidCredentials
        case network

        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Invalid email or password."
            case .network:
                return "Network error. Please try again."
            }
        }
    }

    func login(email: String, password: String, completion: @escaping (Result<LoginEntity.Response, Error>) -> Void) {

        // Legacy demo: fake network delay + fake auth
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.6) {

            if email.lowercased() == "a@b.com" && password == "x" {
                completion(.success(.init(token: "token_123", userId: "user_1")))
            } else {
                completion(.failure(LoginError.invalidCredentials))
            }
        }
    }
}
