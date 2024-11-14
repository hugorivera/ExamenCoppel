//
//  RegistrationWorker.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation
import Combine

enum RegistrationError: Error {
    case incompleteData
    case invalidEmail
    case weakPassword
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .incompleteData:
            return "Por favor, completa todos los campos."
        case .invalidEmail:
            return "El email no es válido."
        case .weakPassword:
            return "La contraseña debe tener al menos 8 caracteres."
        case .unknownError:
            return "Ocurrió un error desconocido."
        }
    }
}


protocol RegistrationLogic {
    func register(user: InfoUser) -> AnyPublisher<String, RegistrationError>
}

final class RegistrationWorker: RegistrationLogic {
    func register(user: InfoUser) -> AnyPublisher<String, RegistrationError> {
        return Future<String, RegistrationError> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                promise(.success("Registro exitoso para \(user.name)"))
            }
        }
        .eraseToAnyPublisher()
    }
    
}

