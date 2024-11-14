//
//  SceneFactory.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation
import UIKit

protocol SceneFactory {
    var configurator: RegistrationConfigurator! { get set }
    func makeLogicScene() -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    var configurator: RegistrationConfigurator!
    
    func makeLogicScene() -> UIViewController {
        let vc = RegistrationViewController()
        return configurator.configured(vc)
    }
}
