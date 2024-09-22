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
        
        return view
    }()

}

