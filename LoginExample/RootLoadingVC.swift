//
//  RootLoadingVC.swift
//  LoginExample
//
//  Created by Tao, Peter on 10/21/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class RootLoadingVC: UIViewController {
    
    var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator = UIActivityIndicatorView(frame: view.frame)
        loadingIndicator.startAnimating()
        view.backgroundColor = UIColor.green
        view.addSubview(loadingIndicator)
    }
}
