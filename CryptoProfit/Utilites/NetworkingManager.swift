//
//  NetworkingManager.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 1.09.22.
//

// MARK: Наш сетевой менеджер с частью вынесенных по отдельности функций

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingErrors: LocalizedError {
        case badURLResponse(url: URL)
        case unknow
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "[🔥] Bad response from URL: \(url)"
            case .unknow:
                return "[⚠️] Unknow error occured"
            }
        }
    }
    
    
    // Статическая нужна для того, чтобы не инициализировать класс
    // Функция скачивает по url нашу дату (любую)
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default)) // Подписываемся и говорим, что это будет работать в бэкпотоке
            .tryMap({ try handleURLResponse(output: $0, url: url)})   // Отдельно отрабатываем URLResponse
            .receive(on: DispatchQueue.main)        // Возвращаемся на главный поток
            .eraseToAnyPublisher()      // приводим тип к простому виду паблишера с data и error
    }
    
    // Отрабатываем URLResponse
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingErrors.badURLResponse(url: url)
        }
        return output.data
    }
    
    // Отрабатываем комплишн на ошибки
    static func handleComplition(complition: Subscribers.Completion<Error>) {
        switch complition {
        case .finished:     // Если все норм то ничего не делаем
            break
        case .failure(let error):       // Иначе печатаем ошибку
            print(error.localizedDescription)
        }
    }
    
    
}
