//
//  HomeView.swift
//  Kream
//
//  Created by 김민지 on 10/6/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.font = UIFont.systemFont(ofSize: 14.5)
        textField.backgroundColor = UIColor(named: "kream_lightLightGray")
        textField.layer.borderColor = .none
        textField.layer.cornerRadius = 12.0

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var alarmButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "bell")
        
        button.tintColor = .black
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    public let homeSegmentedControl : UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "추천", at: 0, animated: true)
        segment.insertSegment(withTitle: "랭킹", at: 1, animated: true)
        segment.insertSegment(withTitle: "발매정보", at: 2, animated: true)
        segment.insertSegment(withTitle: "남성", at: 3, animated: true)
        segment.insertSegment(withTitle: "여성", at: 4, animated: true)
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ], for: .normal)
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
        ], for: .selected)
        
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        return segment
    }()
    
    public let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    
    private func addComponents(){
        self.addSubview(searchTextField)
        self.addSubview(alarmButton)
        self.addSubview(homeSegmentedControl)
        self.addSubview(underLineView)

        
        searchTextField.snp.makeConstraints {
            $0.top.lessThanOrEqualToSuperview().offset(51)
            $0.leading.equalToSuperview().offset(16)
            $0.width.lessThanOrEqualTo(303)
            $0.height.equalTo(40)
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.lessThanOrEqualToSuperview().offset(59)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(15)
            $0.width.height.lessThanOrEqualTo(24)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        homeSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(27)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(homeSegmentedControl.snp.bottom).offset(8)
            $0.width.lessThanOrEqualTo(28)
            $0.height.lessThanOrEqualTo(2)
            $0.leading.equalTo(homeSegmentedControl.snp.leading)
        }
        
    }
}
