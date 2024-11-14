//
//  NewsProtocols.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 11/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Presenter -> Router
protocol NewsWireframeProtocol: AnyObject {
    func goToDetail(_ datum: Datum)
    func goBack()
}

//MARK: View -> Presenter
protocol NewsPresenterProtocol: AnyObject {
    var interactor: NewsInteractorInputProtocol? { get set }
    
    func getNews()
    
    func showDetails(_ datum: Datum)
    
    func goBack()
}

//MARK: Interactor -> Presenter
protocol NewsInteractorOutputProtocol: AnyObject {
    func setNews(_ news: [Datum])
    func showError(error: String)
}

//MARK: Presenter -> Interactor
protocol NewsInteractorInputProtocol: AnyObject {
    var presenter: NewsInteractorOutputProtocol?  { get set }
    func getNews()
}

//MARK: Presenter -> View
protocol NewsViewProtocol: AnyObject {
    var presenter: NewsPresenterProtocol?  { get set }
    func setNews(_ news: [Datum])
    func showError(error: String)
}
