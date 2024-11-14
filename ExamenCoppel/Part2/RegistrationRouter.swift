//
//  RegistrationRouter.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation
import UIKit

protocol RegistrationRoutingLogic {
    func showRegistrationSuccess()
    func showRegisterError(message: String)
    func goBack()
}

final class RegistrationRouter: RegistrationRoutingLogic {
    
    weak var viewController: RegistrationViewController?
    
    private let sceneFactory: SceneFactory
        
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    func showRegistrationSuccess() {
        let alertController = UIAlertController(title: "Éxito", message: "Usuario registrado con éxito", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showRegisterError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    func goBack() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
