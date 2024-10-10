//
//  HomeViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let recommendView = RecommendView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        setupView()
    }
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.homeSegmentedControl.addTarget(self, action: #selector(changeSegmentLineView(_:)), for: .valueChanged)
        view.homeSegmentedControl.addTarget(self, action: #selector(changeSegmentView(_:)), for: .valueChanged)
        
        return view
    }()
    
    private func setupView() {
        homeView.addSubview(recommendView)  // homeView에 recommendView 추가
        recommendView.isHidden = true // 기본적으로 숨김 처리
        
        recommendView.snp.makeConstraints {
            $0.top.equalTo(homeView.underLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(homeView.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // 선택된 세그먼트에 맞춰 underLineView의 위치를 애니메이션으로 이동
    @objc private func changeSegmentLineView(_ segment: UISegmentedControl) {
        let selectedSegmentIndex = homeView.homeSegmentedControl.selectedSegmentIndex                      // 세그먼트의 인덱스값
        let segmentFrame = homeView.homeSegmentedControl.subviews[selectedSegmentIndex].frame              // 세그먼트의 프레임값
        let segmentTitle = homeView.homeSegmentedControl.titleForSegment(at: selectedSegmentIndex) ?? ""   // 세그먼트의 텍스트
        
        // 텍스트 크기 계산 (세그먼트에 설정된 폰트와 동일한 속성 사용)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        let textWidth = (segmentTitle as NSString).size(withAttributes: textAttributes).width // 텍스트 너비 계산
        
        let segmentWidth = segmentFrame.width               // 세그먼트 프레임 안에서 텍스트 시작점 계산
        let textStartX = (segmentWidth - textWidth)/2       // 중앙에서 텍스트 길이의 절반 만큼 왼쪽으로 이동
        
        // 세그먼트의 시작점 + 텍스트 시작점 = underLineView의 시작점
        let leadingDistance = segmentFrame.origin.x + textStartX

        // 애니메이션으로 underLineView 이동 및 너비 조정
        UIView.animate(withDuration: 0.2) {
            self.homeView.underLineView.snp.updateConstraints {
                $0.leading.equalTo(self.homeView.homeSegmentedControl.snp.leading).offset(leadingDistance)
                $0.width.equalTo(textWidth)
            }
            self.homeView.layoutIfNeeded()
        }
    }
    
    @objc private func changeSegmentView(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            recommendView.isHidden = false
        default:
            recommendView.isHidden = true
        }
    }

}
