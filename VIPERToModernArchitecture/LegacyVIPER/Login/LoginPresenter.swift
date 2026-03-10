//
//  LoginPresenter.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import Foundation

import Foundation

final class LoginPresenter: LoginContracts.Presenter {

    private weak var view: LoginContracts.View?
    private let interactor: LoginContracts.Interactor

    var onLoginSuccess: (() -> Void)?

    init(view: LoginContracts.View, interactor: LoginContracts.Interactor) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidLoad() {
        // no-op for now
    }

    func didTapLogin() {
        guard let view else { return }

        let email = view.getEmail()
        let password = view.getPassword()

        if email.isEmpty || password.isEmpty {
            view.showError("Email and password are required.")
            return
        }

        view.showLoading(true)

        Task { [weak self] in
            guard let self else { return }

            do {
                _ = try await interactor.login(email: email, password: password)

                await MainActor.run {
                    guard let view = self.view else { return }
                    view.showLoading(false)
                    view.showSuccess("Login success.")
                    self.onLoginSuccess?()
                }

            } catch {
                await MainActor.run {
                    guard let view = self.view else { return }
                    view.showLoading(false)
                    view.showError(error.localizedDescription)
                }
            }
        }
    }
}
