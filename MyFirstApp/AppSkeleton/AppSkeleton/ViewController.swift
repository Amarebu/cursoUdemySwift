//
//  ViewController.swift
//  AppSkeleton
//
//  Created by Reguera Bueno Ana María on 8/9/23.
//

import UIKit

class ViewController: UIViewController {

    // todo deriva de UIView, por ejemplo UIWindow, esta ventaba es la ventana completa del dispositivo
    override func viewDidLoad() {
        super.viewDidLoad()
        // super representa a la clase padre
        print("La vista se ha cargado")
        guard let view = self.view else {
            return
        }
        view.backgroundColor = UIColor.blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // La vista va a ser mostrada
        super.viewWillAppear(animated)
        print("La vista va a aparecer, ¿ de forma animada? \(animated)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // La vista ya está visible
        super.viewDidAppear(animated)
        print("La vista ha aparecido, ¿de forma animada? \(animated)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("La vista va a desaparecer,¿ de forma animada? \(animated)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("La vista ha desaparecido, ¿de forma animada? \(animated)")
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("La vista va a cambiar de tamaño \(size)")
    } 
}

