//
//  ProfileManageViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        setupNavigationBar()
    }
    
    private lazy var profileManageView: ProfileManageView = {
        let view = ProfileManageView()
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

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

}
