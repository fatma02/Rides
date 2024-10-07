//
//  FetchAPI.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation
import Combine

protocol Fetchable {
    func fetch<T>(with url: URL, session: URLSession) -> AnyPublisher<T,Error> where T: Decodable
}

extension Fetchable {
    func fetch<T>(with url: URL, session: URLSession) -> AnyPublisher<T,Error> where T: Decodable {
        return session
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let response = element.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
