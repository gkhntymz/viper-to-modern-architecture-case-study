//
//  LoginRouter.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

final class LoginRouter: LoginContracts.Router {

    private weak var nav: UINavigationController?

    init(nav: UINavigationController) {
        self.nav = nav
    }

    func routeToHome() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemGreen
        vc.title = "Home"
        nav?.pushViewController(vc, animated: true)
    }
}
