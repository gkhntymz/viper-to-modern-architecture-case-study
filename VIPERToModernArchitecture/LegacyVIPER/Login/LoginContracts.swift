//
//  LoginContracts.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

enum LoginContracts {

    // MARK: - View
    protocol View: AnyObject {
        func showLoading(_ isLoading: Bool)
        func showError(_ message: String)
        func showSuccess(_ message: String)
        func getEmail() -> String
        func getPassword() -> String
    }

    // MARK: - Presenter
    protocol Presenter: AnyObject {
        func viewDidLoad()
        func didTapLogin()
    }

    // MARK: - Interactor
    protocol Interactor: AnyObject {
        func login(email: String, password: String, completion: @escaping (Result<LoginEntity.Response, Error>) -> Void)
    }
}
