//
//  LoginModel.swift
//  Kream
//
//  Created by 김민지 on 9/17/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    public var emailKey: String = "userEmail"         // key값을 userEmail로 설정
    public var passwordKey: String = "userPwd"
    
    // UserDefaults로 데이터 저장
    public func saveUserId(_ text: String) {
        userDefaults.set(text, forKey: emailKey)
    }
    public func saveUserPwd(_ text: String) {
        userDefaults.set(text, forKey: passwordKey)
    }
    
    // UserDefaults에 저장된 값을 불러옴
    public func loadUserId() -> String? {
        return userDefaults.string(forKey: emailKey)
    }
    public func loadUserPwd() -> String? {
        return userDefaults.string(forKey: passwordKey)
    }
}
