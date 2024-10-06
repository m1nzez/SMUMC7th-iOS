//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class ProfileManageViewController: UIViewController {
    private let loginModel = LoginModel()
    
    var userEmail: String = ""
    var userPwd: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileManageView.userEmailTextField.text = loginModel.loadUserId()
        profileManageView.userPasswordTextField.text = loginModel.loadUserPwd()
    }
    
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
        
        view.userEmailChangeButton.addTarget(self, action: #selector(emailiChangeButtonTapped), for: .touchUpInside)
        view.userPasswordChangeButton.addTarget(self, action: #selector(passwordChangeButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    // 네비게이션바는 ViewController에서 설정
    func setupNavigationBar() {
        // 백 버튼 추가
        let backButton = UIButton(type: .system)
        let image = UIImage(systemName: "arrow.left")
        backButton.tintColor = .black
        backButton.setImage(image, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: true)
        self.navigationItem.title = "프로필 관리"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .foregroundColor: UIColor.black
        ]
    }
    
//    func editNavigationBar(){
//        let customBackButtonImage = UIImage(systemName: "arrow.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//        let customBackButton = UIBarButtonItem(image: customBackButtonImage, style: .plain, target: self, action: #selector(tapDismissButton))
//            
//        self.navigationItem.hidesBackButton = true //backbutton 숨기기
//        self.navigationItem.leftBarButtonItem = customBackButton
//    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func emailiChangeButtonTapped() {
        if profileManageView.isEmailEditing == false {
            // 이메일 수정 모드
            profileManageView.userEmailTextField.text = nil
            profileManageView.userEmailChangeButton.setTitle("확인", for: .normal)
            profileManageView.userEmailTextField.isEnabled = true
            profileManageView.isEmailEditing = true
        } else {
            // 이메일 저장 및 확인 모드
            if let updatedEmail = profileManageView.userEmailTextField.text, !updatedEmail.isEmpty {
                    loginModel.saveUserId(updatedEmail)
                print("\(updatedEmail)")

            }
            profileManageView.userEmailChangeButton.setTitle("변경", for: .normal)
            profileManageView.userEmailTextField.isEnabled = false
            profileManageView.isEmailEditing = false
        }
    }
    
    @objc func passwordChangeButtonTapped() {
        if profileManageView.isPasswordEditing == false {
            profileManageView.userPasswordTextField.text = nil
            profileManageView.userPasswordChangeButton.setTitle("확인", for: .normal)
            profileManageView.userPasswordTextField.isEnabled = true
            profileManageView.isPasswordEditing = true
        } else {
            if let updatedPassword = profileManageView.userPasswordTextField.text, !updatedPassword.isEmpty {
                    loginModel.saveUserId(updatedPassword)
                print("\(updatedPassword)")
            }
            profileManageView.userPasswordChangeButton .setTitle("변경", for: .normal)
            profileManageView.userPasswordTextField.isEnabled = false
            profileManageView.isPasswordEditing = false
        }
    }
 
}
