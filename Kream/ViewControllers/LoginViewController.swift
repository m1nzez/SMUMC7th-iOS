//
//  ViewController.swift
//  Kream
//
//  Created by 김민지 on 9/16/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.emailLoginButton.addTarget(self, action: #selector(emailLoginButtonTapped), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        view.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    @objc func emailLoginButtonTapped() {
        let viewController = MainTabBarViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
    @objc func kakaoLoginButtonTapped() {
        
    }
    
    @objc func appleLoginButtonTapped() {
        
    }
}
