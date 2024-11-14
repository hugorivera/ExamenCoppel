//
//  DetailPresenter.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 12/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DetailPresenter {
    weak private var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    private let router: DetailWireframeProtocol

    init(interface: DetailViewProtocol, interactor: DetailInteractorInputProtocol?, router: DetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
}
