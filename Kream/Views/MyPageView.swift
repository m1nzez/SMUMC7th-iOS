//
//  MyPageView.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var setButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "gearshape")
        
        button.tintColor = .black
        button.setImage(image, for: .normal)

        return button
    }()

    public lazy var cameraButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "camera")
        
        button.tintColor = .black
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    public lazy var profileManageButton: UIButton = {
        let button = UIButton(type: .system)
        
        let font = UIFont(name: "Pretendard", size: 9) ?? UIFont.systemFont(ofSize: 9)
        let attributes: [NSAttributedString.Key: Any] = [ .font: font ]
        let attributedTitle = NSAttributedString(string: "프로필 관리", attributes: attributes)
         
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    public lazy var profileShareButton: UIButton = {
        let button = UIButton(type: .system)
        
        let font = UIFont(name: "Pretendard", size: 9) ?? UIFont.systemFont(ofSize: 9)
        let attributes: [NSAttributedString.Key: Any] = [ .font: font ]
        let attributedTitle = NSAttributedString(string: "프로필 공유", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    
    public func addComponents() {
        self.addSubview(setButton)
        self.addSubview(cameraButton)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        
        setButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
            $0.trailing.equalToSuperview().inset(333.5)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalTo(setButton.snp.leading).offset(302)
            $0.trailing.equalToSuperview().inset(32.5)
        }
        
        profileManageButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(242)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        profileShareButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(242)
            $0.leading.equalTo(profileManageButton.snp.trailing).offset(14) // profileManageButton의 오른쪽에 위치
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
    }
}
