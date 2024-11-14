//
//  DetailRouter.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 12/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DetailRouter: DetailWireframeProtocol {
    weak var viewController: UIViewController?

    static func createModule(data: Datum) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: Bundle(for: DetailViewController.self))
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        view.data = data

        return view
    }
}
