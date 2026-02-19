//
//  LoginModuleBuilder.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

enum LoginModuleBuilder {

    static func build(in nav: UINavigationController) -> UIViewController {

        let view = LoginViewController()
        let interactor = LoginInteractor()
        let router = LoginRouter(nav: nav)
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        return view
    }
}
