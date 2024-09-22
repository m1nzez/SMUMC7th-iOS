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
        
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = UIColor.black
        label.text = "이메일 주소"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
     }()
    
    //  비밀번호 라벨 및 textfield
    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
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
        textField.font = UIFont.systemFont(ofSize: 15)
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
        let boldFont = UIFont.boldSystemFont(ofSize: 16) // 원하는 크기로 설정
        let attributes: [NSAttributedString.Key: Any] = [ .font: boldFont ]
        let attributedTitle = NSAttributedString(string: "카카오로 로그인", attributes: attributes)
        
        button.setAttributedTitle(attributedTitle, for: .normal)

        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(named: "kream_lightGray")?.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let logoImage = UIImageView(image: UIImage(systemName: "kakaologo")) 
        logoImage.tintColor = .black  // 로고 색상 설정
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        button.addSubview(logoImage)
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
