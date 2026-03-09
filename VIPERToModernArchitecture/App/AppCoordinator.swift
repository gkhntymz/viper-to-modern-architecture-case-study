//
//  AppCoordinator.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 9.03.2026.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let loginVC = LoginModuleBuilder.build()
        navigationController.setViewControllers([loginVC], animated: false)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
