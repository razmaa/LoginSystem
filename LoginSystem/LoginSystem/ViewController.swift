//
//  ViewController.swift
//  LoginSystem
//
//  Created by nika razmadze on 02.08.25.
//

import UIKit

final class LoginViewController: UIViewController {
    private let emailField = UITextField()
    private let loginButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        emailField.placeholder = "Email"
        emailField.borderStyle  = .roundedRect
        loginButton.setTitle("Log In", for: .normal)
        
        loginButton.addTarget(self,
                              action: #selector(handleLogin),
                              for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [emailField, loginButton])
        stack.axis         = .vertical
        stack.spacing      = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    @objc private func handleLogin() {
        guard let email = emailField.text, !email.isEmpty else { return }
        UserSessionManager.shared.startSession(email: email)
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .setRoot(MainViewController(), animated: true)
    }
}

