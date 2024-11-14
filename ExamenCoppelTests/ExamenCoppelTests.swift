//
//  ExamenCoppelTests.swift
//  ExamenCoppelTests
//
//  Created by Hugo Rivera on 11/11/24.
//

import XCTest
import Combine
@testable import ExamenCoppel

final class ExamenCoppelTests: XCTestCase {

    var interactor: RegistrationInteractor!
    var presenter: MockRegistrationPresenter!
    var worker: MockAuthWorker!
    
    override func setUp() {
        super.setUp()
        presenter = MockRegistrationPresenter()
        worker = MockAuthWorker()
        interactor = RegistrationInteractor()
        interactor.presenter = presenter
        interactor.worker = worker
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
        worker = nil
        super.tearDown()
    }
    
    func testEmptyfields() {
        let user = InfoUser(name: "", email: "", password: "")
        interactor.register(user: user)
        XCTAssertEqual(presenter.error, .incompleteData)
    }
    
    func testInvalidEmail() {
        let user = InfoUser(name: "Hugo", email: "hugo@", password: "12345678")
        interactor.register(user: user)
        XCTAssertEqual(presenter.error, .invalidEmail)
    }
    
    func testWeakPassword() {
        let user = InfoUser(name: "Hugo", email: "hugo@correo.com", password: "1234")
        interactor.register(user: user)
        XCTAssertEqual(presenter.error, .weakPassword)
    }

}

class MockRegistrationPresenter: RegistrationInteractorOutput {
    var error: RegistrationError?
    
    func registrationSuccess() {
    }
    
    func registrationFailure(error: RegistrationError) {
        self.error = error
    }
}

class MockAuthWorker: RegistrationLogic {
    func register(user: InfoUser) -> AnyPublisher<String, RegistrationError> {
        return Just("Success")
            .setFailureType(to: RegistrationError.self)
            .eraseToAnyPublisher()
    }
}
