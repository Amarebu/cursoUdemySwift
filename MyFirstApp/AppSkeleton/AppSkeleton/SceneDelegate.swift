//
//  SceneDelegate.swift
//  AppSkeleton
//
//  Created by Reguera Bueno Ana María on 8/9/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate { // Aqui tenemos el responder por lo que podemos decir que este tambien recibe elementos

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // as? lo que hace es convertirte un tipo en otro
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let viewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

