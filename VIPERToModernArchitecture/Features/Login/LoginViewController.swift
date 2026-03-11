//
//  LoginViewController.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import UIKit

final class LoginViewController: UIViewController, LoginContracts.View {

    var presenter: LoginContracts.Presenter!

    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let statusLabel = UILabel()
    private let spinner = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login (VIPER)"
        view.backgroundColor = .systemBackground
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {

        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.autocapitalizationType = .none
        emailField.keyboardType = .emailAddress
        emailField.text = "a@b.com"

        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.text = "x"

        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)

        statusLabel.numberOfLines = 0
        statusLabel.textAlignment = .center
        statusLabel.font = .systemFont(ofSize: 14)

        spinner.hidesWhenStopped = true

        let stack = UIStackView(arrangedSubviews: [emailField, passwordField, loginButton, spinner, statusLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func didTapLogin() {
        presenter.didTapLogin()
    }

    // MARK: - View contract

    func showLoading(_ isLoading: Bool) {
        loginButton.isEnabled = !isLoading
        if isLoading {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }

    func showError(_ message: String) {
        statusLabel.text = "❌ \(message)"
    }

    func showSuccess(_ message: String) {
        statusLabel.text = "✅ \(message)"
    }

    func getEmail() -> String {
        emailField.text ?? ""
    }

    func getPassword() -> String {
        passwordField.text ?? ""
    }
}
