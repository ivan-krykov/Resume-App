//
//  SceneDelegate.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = Assembly().createViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
