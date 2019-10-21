//
//  LoginVC.swift
//  LoginExample
//
//  Created by Tao, Peter on 10/21/19.
//  Copyright © 2019 Test. All rights reserved.
//

import SwiftUI

class LoginVC: UIViewController {
    
    var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton = UIButton(frame: view.frame)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        view.addSubview(loginButton)
        view.backgroundColor = UIColor.red
        self.title = "Login Screen"
        
    }
    
    @objc func login() {
        loginButton.isEnabled = false
        CurrentUser.shared.login(callback: {_ in
            print("finished logging in")
        })
    }
}
