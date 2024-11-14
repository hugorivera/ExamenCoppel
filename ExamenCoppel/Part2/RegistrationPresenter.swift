//
//  RegistrationPresenter.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation

typealias RegistrationPresenterInput = RegistrationInteractorOutput
typealias RegistrationPresenterOutput = RegistrationViewControllerInput

final class RegistrationPresenter: RegistrationPresenterInput {
    weak var viewController: RegistrationPresenterOutput?
    
    func registrationSuccess() {
        viewController?.registrationSuccess()
    }
    
    func registrationFailure(error: RegistrationError) {
        viewController?.registrationFailure(message: error.errorDescription ?? "")
    }
    
}
