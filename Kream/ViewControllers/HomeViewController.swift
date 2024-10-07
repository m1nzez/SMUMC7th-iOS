//
//  HomeViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.homeSegmentedControl.addTarget(self, action: #selector(changeSegmentedControlLineView(_:)), for: .valueChanged)
        
        return view
    }()
    
    // 선택된 세그먼트에 맞춰 underLineView의 위치를 애니메이션으로 이동
    @objc private func changeSegmentedControlLineView(_ segment: UISegmentedControl) {
        // 선택된 세그먼트의 프레임을 가져와서 leadingDistance로 사용
        let selectedSegmentIndex = homeView.homeSegmentedControl.selectedSegmentIndex
        let segmentWidth = homeView.homeSegmentedControl.frame.width / CGFloat(homeView.homeSegmentedControl.numberOfSegments)
            
        // 선택된 세그먼트의 시작 지점 (leading) 계산
        let leadingDistance = homeView.homeSegmentedControl.frame.origin.x + (segmentWidth * CGFloat(selectedSegmentIndex))
        
        UIView.animate(withDuration: 0.2, animations: {
            self.homeView.underLineView.snp.updateConstraints { $0.leading.equalTo(self.homeView.homeSegmentedControl.snp.leading).offset(leadingDistance)
            }
        })
    }


}
