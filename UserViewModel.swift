//
//  UserViewModel.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation

class UserViewModel {
    var username:Dynamic<String>!
    var password:Dynamic<String>!
    
    
    init(username: String, password: String) {
        self.username = Dynamic<String>(username)
        self.password = Dynamic<String>(password)
    }
}
