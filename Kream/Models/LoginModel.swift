//
//  LoginModel.swift
//  Kream
//
//  Created by 김민지 on 9/17/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    init(id: String, pwd: String) {
        self.id = id
        self.pwd = pwd
    }
}
