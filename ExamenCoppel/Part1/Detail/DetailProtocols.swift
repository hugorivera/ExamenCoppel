//
//  DetailProtocols.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 12/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

//MARK: Presenter -> Router
protocol DetailWireframeProtocol: AnyObject {
    
}

//MARK: View -> Presenter
protocol DetailPresenterProtocol: AnyObject {
    var interactor: DetailInteractorInputProtocol? { get set }
}

//MARK: Interactor -> Presenter
protocol DetailInteractorOutputProtocol: AnyObject {
    
}

//MARK: Presenter -> Interactor
protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol?  { get set }
}

//MARK: Presenter -> View
protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol?  { get set }
}
