//
//  ViewController.swift
//  LoginExample
//
//  Created by Tao, Peter on 10/21/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton = UIButton(frame: view.frame)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(self.logout), for: .touchUpInside)
        view.addSubview(logoutButton)
        view.backgroundColor = UIColor.blue
        self.title = "Home Screen"
    }
    
    @objc func logout() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "logout"), object: nil, userInfo: nil)
    }


}

