//
//  MainViewController.swift
//  LoginSystem
//
//  Created by nika razmadze on 02.08.25.
//

import UIKit

final class MainViewController: UIViewController {
    private let welcomeLabel = UILabel()
    private let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        welcomeLabel.text      = "Welcome, \(UserSessionManager.shared.email ?? "Guest")"
        welcomeLabel.font      = .systemFont(ofSize: 20, weight: .medium)
        logoutButton.setTitle("Log Out", for: .normal)
        
        logoutButton.addTarget(self,
                               action: #selector(handleLogout),
                               for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [welcomeLabel, logoutButton])
        stack.axis         = .vertical
        stack.spacing      = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func handleLogout() {
        UserSessionManager.shared.endSession()
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?
            .setRoot(LoginViewController(), animated: true)
    }
}
