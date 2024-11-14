//
//  NewsPresenter.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 11/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewsPresenter {
    weak private var view: NewsViewProtocol?
    var interactor: NewsInteractorInputProtocol?
    private let router: NewsWireframeProtocol

    init(interface: NewsViewProtocol, interactor: NewsInteractorInputProtocol?, router: NewsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension NewsPresenter: NewsPresenterProtocol {
    func goBack() {
        router.goBack()
    }
    
    func showDetails(_ datum: Datum) {
        router.goToDetail(datum)
    }
    
    func getNews() {
        interactor?.getNews()
    }
}

extension NewsPresenter: NewsInteractorOutputProtocol {
    func showError(error: String) {
        view?.showError(error: error)
    }
    
    func setNews(_ news: [Datum]) {
        if news.count > 0 {
            view?.setNews(news)
        } else {
            view?.showError(error: "No hay noticias para mostrar")
        }
    }
}
