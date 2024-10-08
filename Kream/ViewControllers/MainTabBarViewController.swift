//
//  MainTabBarViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    private let homeVC = UINavigationController(rootViewController: HomeViewController())
    private let styleVC = UINavigationController(rootViewController: StyleViewController())
    private let shopVC = UINavigationController(rootViewController: ShopViewController())
    private let savedVC = UINavigationController(rootViewController: SavedViewController())
    private let myVC = UINavigationController(rootViewController: MyPageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "newspaper"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "text.magnifyingglass"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "clipboard"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
        // 탭 선택 시 검정색으로 설정
        self.tabBar.tintColor = .black
    }

}
