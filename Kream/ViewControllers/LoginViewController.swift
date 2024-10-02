//
//  ViewController.swift
//  Kream
//
//  Created by 김민지 on 9/16/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
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
        // 로그인 아이디 비번 저장
        guard let emailInfo = loginView.emailTextField.text, !emailInfo.isEmpty,
              let pwdInfo = loginView.pwdTextField.text, !pwdInfo.isEmpty else {
            return
        }
        // 모델을 통해 텍스트 저장
        loginModel.saveUserId(emailInfo)
        loginModel.saveUserPwd(pwdInfo)
        
        print("\(emailInfo), \(pwdInfo)")
        
        // 모달로 화면 이동
        let viewController = MainTabBarViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func kakaoLoginButtonTapped() {
    }
    
    @objc func appleLoginButtonTapped() {
    }
}
