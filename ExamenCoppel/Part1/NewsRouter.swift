//
//  NewsRouter.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 11/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewsRouter: NewsWireframeProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = NewsViewController(nibName: "NewsViewController", bundle: Bundle(for: NewsViewController.self))
        let interactor = NewsInteractor()
        let router = NewsRouter()
        let presenter = NewsPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToDetail(_ datum: Datum) {
        let vc = DetailRouter.createModule(data: datum)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
