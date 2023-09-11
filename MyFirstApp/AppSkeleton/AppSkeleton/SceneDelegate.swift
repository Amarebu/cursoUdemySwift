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

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Justo antes de entrar en el estado Foreground
        // Cualquer cosa que esté fuera de los storyBoards, hay que hacerlo en este punto
        print("La escena va a pasar a primer plano")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("La escena empezó a ser la escena activa")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("La escena va a dejar de ser la escena activa")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print(" La escena ha entrado en segundo plano, y la escena ya no es visible")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("La escena se va a desconectar")
    }


}

