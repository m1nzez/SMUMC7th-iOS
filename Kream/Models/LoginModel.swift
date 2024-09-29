//
//  LoginModel.swift
//  Kream
//
//  Created by 김민지 on 9/17/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    private var email: String = ""
    private var pwd: String = ""
    
    public func saveUserId(_ text: String) {
        userDefaults.set(text, forKey: email)
    }
    
    public func saveUserPwd(_ text: String) {
        userDefaults.set(text, forKey: pwd)
    }
    
}
