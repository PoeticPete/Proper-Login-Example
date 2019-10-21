//
//  CurrentUser.swift
//  LoginExample
//
//  Created by Tao, Peter on 10/21/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation

/// Current User of the app. Singleton.
class CurrentUser {
    
    private init(){}
    
    static let shared = CurrentUser()
    var isLoggedIn = false
    
    
    func login(callback: @escaping (Bool) -> ()) {
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.isLoggedIn = true
            print("logged in!")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "login"), object: nil, userInfo: nil)
            callback(self.isLoggedIn)
        }
    }
    
    func logout() {
        self.isLoggedIn = false
    }
    
}
