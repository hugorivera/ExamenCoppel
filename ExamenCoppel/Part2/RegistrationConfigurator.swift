//
//  RegistrationConfigurator.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation

protocol RegistrationConfigurator {
    func configured(_ vc: RegistrationViewController) -> RegistrationViewController
}

final class DefaultRegistrationConfigurator: RegistrationConfigurator {
    
    private var sceneFactory: SceneFactory
    
    init(sceneFactory: SceneFactory) {
        self.sceneFactory = sceneFactory
    }
    
    @discardableResult
    func configured(_ vc: RegistrationViewController) -> RegistrationViewController {
        sceneFactory.configurator = self
        let worker = RegistrationWorker()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter(sceneFactory: sceneFactory)
        router.viewController = vc
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.worker = worker
        vc.interactor = interactor
        vc.router = router
        return vc
    }
}
