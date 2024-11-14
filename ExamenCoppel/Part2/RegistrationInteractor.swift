//
//  RegistrationInteractor.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation
import Combine

typealias RegistrationInteractorInput = RegistrationViewControllerOutput

protocol RegistrationInteractorOutput: AnyObject {
    func registrationSuccess()
    func registrationFailure(error: RegistrationError)
}

final class RegistrationInteractor: RegistrationInteractorInput {
    var presenter: RegistrationPresenterInput?
    var worker: RegistrationLogic?
    
    private var cancellables = Set<AnyCancellable>()
    
    func register(user: InfoUser) {
        
        if user.name.isEmpty || user.email.isEmpty || user.password.isEmpty {
            self.presenter?.registrationFailure(error: .incompleteData)
            return
        }
        
        if !isValidEmail(user.email) {
            self.presenter?.registrationFailure(error: .invalidEmail)
            return
        }
        
        if user.password.count < 8 {
            self.presenter?.registrationFailure(error: .weakPassword)
            return
        }
        
        worker?.register(user: user)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.presenter?.registrationFailure(error: error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] successMessage in
                self?.presenter?.registrationSuccess()
            })
            .store(in: &cancellables)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}
