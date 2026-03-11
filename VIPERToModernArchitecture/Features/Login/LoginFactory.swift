//
//  LoginFactory.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

enum LoginFactory {

    static func makeLoginViewController(authService: AuthService, onLoginSuccess: @escaping () -> Void) -> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor(authService: authService)
        let presenter = LoginPresenter(view: view, interactor: interactor)

        presenter.onLoginSuccess = onLoginSuccess
        view.presenter = presenter

        return view
    }
}
