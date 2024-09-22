//
//  LoginView.swift
//  Kream
//
//  Created by 김민지 on 9/17/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    // 크림 로고 이미지뷰
    public lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kream_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이메일 주소 라벨 및 textfield
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor.black
        label.text = "이메일 주소"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none       // 기본 테두리 대신 커스텀 설정을 위해 사용
        
        // 테두리 설정
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 15.0
        
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 12)
        
        // left padding 설정
        // paddingView: UIview를 이용해 텍스트 필드의 왼쪽에 10pt의 패딩을 줌
        // leftView에 넣어줌으로써 placeholder와 텍스트가 왼쪽에 붙지 않고 여백이 생김
        // .always로 설정해 항상 여백이 유지되도록 함
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
     }()
    
    //  비밀번호 라벨 및 textfield
    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor.black
        label.text = "비밀번호"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 12)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
    
        return textField
     }()
    
    // 로그인 버튼
    public lazy var emailLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(named: "kream_lightGray")
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 카카오 로그인 버튼
    public lazy var kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        
        // 카카오 폰트 설정
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [ .font: boldFont ]
        let attributedTitle = NSAttributedString(string: "카카오로 로그인", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal) // 버튼에 NSAttributedString으로 포맷된 제목을 설정

        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        
        // 카카오 메시지 로고 추가 및 위치 제약 설정
        let logoImage = UIImageView(image: UIImage(systemName: "message.fill"))
        logoImage.tintColor = .black
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(logoImage)

        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            logoImage.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 17),   // 로고 크기
            logoImage.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        // 버튼 텍스트의 위치 조정
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    // 애플 로그인 버튼
    public lazy var appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        // borderColor는 CALayer속성이기에 UIClor대신 CGColor를 사용해야함
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        
        // 애플 메시지 로고 추가 및 위치 제약 설정
        let logoImage = UIImageView(image: UIImage(systemName: "apple.logo"))
        logoImage.tintColor = .black
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(logoImage)

        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 17),
            logoImage.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 16.7),   // 로고 크기
            logoImage.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // 버튼 텍스트의 위치 조정
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    

    public func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(emailLoginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)

        // Constraint 잡기
        NSLayoutConstraint.activate([
            // Logo Image
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 86),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 287),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),
            
            // Email Label
            emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 87),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            //emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
                  
            // Email TextField
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
                  
            // Password Label
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            //passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                  
            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
                  
            // 이메일 로그인 버튼
            emailLoginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            emailLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            emailLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            emailLoginButton.heightAnchor.constraint(equalToConstant: 38),
                  
            // 카카오 로그인 버튼
            kakaoLoginButton.topAnchor.constraint(equalTo: emailLoginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
                  
            // 애플 로그인 버튼
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 47.5),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47.5),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
