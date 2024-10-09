//
//  MyPageView.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit
import SnapKit

class MyPageView: UIView {
    
    private let profileImageViewSize: CGFloat = 90
    
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
    
    public lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = profileImageViewSize / 2
        imageView.layer.masksToBounds = true // 경계 밖의 내용이 잘리도록 설정
        
        return imageView
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
        self.addSubview(profileImageView)
        self.addSubview(profileManageButton)
        self.addSubview(profileShareButton)
        
        setButton.snp.makeConstraints {
            $0.width.height.equalTo(25)
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(32.5)
        }
        
        cameraButton.snp.makeConstraints {
            $0.width.height.lessThanOrEqualTo(25)
            $0.top.equalToSuperview().offset(75)
            $0.trailing.equalToSuperview().offset(-32.5)
        }
                
        profileImageView.snp.makeConstraints{
            $0.top.lessThanOrEqualTo(setButton.snp.bottom).offset(26)
            $0.leading.equalTo(setButton)
            $0.width.height.lessThanOrEqualTo(profileImageViewSize)
        }
        
        profileManageButton.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(157)
            $0.height.equalTo(26)
            $0.top.equalToSuperview().offset(242)
            $0.leading.equalTo(profileImageView)
            $0.trailing.equalTo(profileShareButton.snp.leading).offset(-14)
        }
        
        profileShareButton.snp.makeConstraints {
            $0.width.equalTo(profileManageButton) // 두 버튼의 너비를 동일하게 설정
            $0.height.equalTo(26)
            $0.top.equalToSuperview().offset(242)
            $0.leading.equalTo(profileManageButton.snp.trailing).offset(14)
            $0.trailing.equalTo(cameraButton)
        }
        
    }
}
