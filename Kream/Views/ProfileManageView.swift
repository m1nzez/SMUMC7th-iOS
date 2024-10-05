//
//  ProfileManageView.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import Foundation
import UIKit
import SnapKit

class ProfileManageView: UIView {
    
    var isEmailEditing = true
    var isPasswordEditing = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 90/2
        imageView.layer.masksToBounds = true // 경계 밖의 내용이 잘리도록 설정
        
        return imageView
    }()
    
    private lazy var profileInfoLabel: UILabel =  {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    private lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor.black
        label.text = "유저 이메일"
        label.textAlignment = .left
        
        return label
    }()
    
    public lazy var userEmailTextField: UITextField = {
        let textField = UITextField()
        textField.text = UserDefaults.standard.string(forKey: "userEmail")
        textField.placeholder = "새로운 이메일을 입력해주세요!"
        textField.font = UIFont.systemFont(ofSize: 14)
        
        textField.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10.0
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true

            
        return textField
    }()
    
    public lazy var userEmailChangeButton : UIButton = {
        let button = UIButton()

        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key: Any] = [ .font: font ]
        let attributedTitle = NSAttributedString(string: "변경", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)

        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    public lazy var userPasswordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor.black
        label.text = "유저 비밀번호"
        label.textAlignment = .left
        
        return label
    }()
    
    
    public lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.text = UserDefaults.standard.string(forKey: "userPwd")
        textField.placeholder = "새로운 비밀번호을 입력해주세요!"
        textField.font = UIFont.systemFont(ofSize: 14)
        
        textField.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10.0
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true

        
        return textField
    }()
    
    public lazy var userPasswordChangeButton : UIButton = {
        let button = UIButton()

        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key: Any] = [ .font: font ]
        let attributedTitle = NSAttributedString(string: "변경", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)

        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    
    public func addComponents() {
        self.addSubview(profileImageView)
        self.addSubview(profileInfoLabel)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailTextField)
        self.addSubview(userEmailChangeButton)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(userPasswordChangeButton)
        
        profileImageView.snp.makeConstraints{
            $0.width.equalTo(90)
            $0.height.equalTo(90)
            $0.top.lessThanOrEqualToSuperview().offset(144)
            $0.centerX.equalToSuperview()
        }
        
        profileInfoLabel.snp.makeConstraints{
            $0.top.lessThanOrEqualToSuperview().offset(254)
            $0.leading.lessThanOrEqualToSuperview().offset(27)
        }

        // 유저 이메일
        userEmailLabel.snp.makeConstraints{
            $0.top.lessThanOrEqualToSuperview().offset(306)
            $0.leading.lessThanOrEqualToSuperview().offset(27)
        }
        
        userEmailTextField.snp.makeConstraints{
            $0.height.equalTo(32)
            $0.width.equalTo(282)
            $0.top.lessThanOrEqualToSuperview().offset(332)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalTo(userEmailChangeButton.snp.leading).offset(-8)
        }
        
        userEmailChangeButton.snp.makeConstraints{
            $0.height.equalTo(32)
            $0.width.equalTo(58)
            $0.leading.lessThanOrEqualTo(userEmailTextField.snp.trailing).offset(8)
            $0.centerY.equalTo(userEmailTextField.snp.centerY)      // 텍스트 필드와 수직 중앙 정렬
            $0.trailing.lessThanOrEqualToSuperview().offset(-17)
        }
        
        // 유저 비밀번호
        userPasswordLabel.snp.makeConstraints{
            $0.top.lessThanOrEqualToSuperview().offset(387)
            $0.leading.lessThanOrEqualToSuperview().offset(27)
        }
        
        userPasswordTextField.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.width.equalTo(282)
            $0.top.lessThanOrEqualToSuperview().offset(413)
            $0.leading.equalToSuperview().offset(27)
            $0.trailing.equalTo(userPasswordChangeButton.snp.leading).offset(-8)
        }
        
        userPasswordChangeButton.snp.makeConstraints{
            $0.height.equalTo(32)
            $0.width.equalTo(58)
            $0.leading.equalTo(userPasswordTextField.snp.trailing).offset(8)
            $0.centerY.equalTo(userPasswordTextField.snp.centerY)   // 텍스트 필드와 수직 중앙 정렬
            $0.trailing.lessThanOrEqualToSuperview().offset(-17)
        }
    }
}
