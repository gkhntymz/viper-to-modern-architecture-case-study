//
//  LoginPresenter.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

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

        interactor.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self, let view = self.view else { return }

                view.showLoading(false)

                switch result {
                case .success:
                    view.showSuccess("Login success.")
                    self.onLoginSuccess?()

                case .failure(let error):
                    view.showError(error.localizedDescription)
                }
            }
        }
    }
}
