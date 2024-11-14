//
//  NetworkError.swift
//  ExamenCoppel
//
//  Created by Hugo Rivera on 12/11/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case requestFailed
    case decodingError
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL no es válida."
        case .requestFailed:
            return "La solicitud ha fallado debido a un problema de red."
        case .decodingError:
            return "Error al procesar los datos de la respuesta."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
