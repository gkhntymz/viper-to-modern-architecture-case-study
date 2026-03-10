//
//  LoginInterector.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

final class LoginInteractor: LoginContracts.Interactor {

    private let authService: AuthService

    init(authService: AuthService) {
        self.authService = authService
    }

    func login(
        email: String,
        password: String,
        completion: @escaping (Result<LoginEntity.Response, Error>) -> Void
    ) {
        authService.login(email: email, password: password, completion: completion)
    }
}
