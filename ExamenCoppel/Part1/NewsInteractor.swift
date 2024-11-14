//
//  NewsInteractor.swift
//  ExamenCoppel
//
//  Created Hugo Rivera on 11/11/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import Combine

class NewsInteractor: NewsInteractorInputProtocol {
    weak var presenter: NewsInteractorOutputProtocol?
    var cancellable: AnyCancellable?
    
    func getNews() {
        cancellable = fetchNews()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Solicitud completada.")
                    case .failure(let error):
                        self.presenter?.showError(error: error.localizedDescription)
                    }
                },
                receiveValue: { articles in
                    self.presenter?.setNews(articles)
                }
            )
    }
    
    func fetchNews() -> AnyPublisher<[Datum], Error>{
        guard let url = URL(string: "https://api.thenewsapi.com/v1/news/top?locale=mx&language=es&api_token=wwHuX62hqnXiRFJroOqzAf79141g6IX1QNqxJy62&categories=business,tech") else {
            return Fail(error: NetworkError.invalidURL)
                        .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                        guard let response = result.response as? HTTPURLResponse, response.statusCode == 200 else {
                            throw NetworkError.requestFailed
                        }
                        return result.data
                    }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return NetworkError.decodingError
                } else if let networkError = error as? NetworkError {
                    return networkError
                } else {
                    return NetworkError.unknown(error)
                }
            }
            .map { articles in
                articles.filter { $0.title.split(separator: " ").count > 5 }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
