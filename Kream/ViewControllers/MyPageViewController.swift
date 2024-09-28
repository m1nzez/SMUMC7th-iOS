//
//  MyPageViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)

        return view
    }()
    
    // present: 모달 방식으로 독립된 화면을 띄움 (돌아갈때는 dismiss)
    // push: 네비게션 컨트롤러를 사용해 화면을 스택에 쌓는 방식 (돌아갈때는 pop) 
    @objc func profileManageButtonTapped() {
        let profileManageVC = ProfileManageViewController()
        // pushViewController를 사용하여 화면 이동
        self.navigationController?.pushViewController(profileManageVC, animated: true)
    }

}
