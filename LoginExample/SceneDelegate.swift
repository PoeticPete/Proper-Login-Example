//
//  SceneDelegate.swift
//  LoginExample
//
//  Created by Tao, Peter on 10/21/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootNavigationController: RootNavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // Prepare the Root Navigation Controller
        let rootLoadingVC = RootLoadingVC()
        self.rootNavigationController = RootNavigationController(rootViewController: rootLoadingVC)
        
        // Attach the window to the scene, and make it visible
        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootNavigationController
        
        // Listen for logout
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogout), name: NSNotification.Name(rawValue: "logout"), object: nil)

        // Listen for login
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogin), name: NSNotification.Name(rawValue: "login"), object: nil)
        
        // Login
        CurrentUser.shared.login { (loggedIn) in
            print("finished logging in. loggedIn: \(loggedIn)")
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}

extension SceneDelegate {
    @objc func handleLogout() {
        rootNavigationController.setViewControllers([LoginVC()], animated: false)
    }
    
    @objc func handleLogin() {
        rootNavigationController.setViewControllers([HomeVC()], animated: false)
    }
}
