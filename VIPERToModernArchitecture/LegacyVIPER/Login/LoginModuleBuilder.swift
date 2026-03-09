//
//  LoginModuleBuilder.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

enum LoginModuleBuilder {

    static func build(onLoginSuccess: @escaping () -> Void) -> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, interactor: interactor)

        presenter.onLoginSuccess = onLoginSuccess
        view.presenter = presenter

        return view
    }
}
