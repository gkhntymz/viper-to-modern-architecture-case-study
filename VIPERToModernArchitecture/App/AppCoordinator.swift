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
    private let container: AppContainer

    init(window: UIWindow, container: AppContainer = AppContainer()) {
        self.window = window
        self.navigationController = UINavigationController()
        self.container = container
    }

    func start() {
        let loginVC = LoginFactory.makeLoginViewController(
            authService: container.authService
        ) { [weak self] in
            self?.showHome()
        }

        navigationController.setViewControllers([loginVC], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    private func showHome() {
        let alert = UIAlertController(
            title: "Success",
            message: "Final architecture flow is now driven by coordinator + DI + async/await.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        navigationController.present(alert, animated: true)
    }
}
