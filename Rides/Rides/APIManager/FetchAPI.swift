//
//  FetchAPI.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation
import Combine

// Protocol that defines a method for fetching data from a URL.
protocol Fetchable {
    // Generic fetch method to be implemented, takes a URL and URLSession as parameters.
    // Returns a publisher that emits a decoded object of type T or an Error.
    func fetch<T>(with url: URL, session: URLSession) -> AnyPublisher<T,Error> where T: Decodable
}

extension Fetchable {
    // Default implementation of the fetch method.
    // Takes a URL and URLSession as input, performs a network request, and decodes the response.
    func fetch<T>(with url: URL, session: URLSession) -> AnyPublisher<T,Error> where T: Decodable {
        return session
            // Creates a data task publisher for the given URL.
            .dataTaskPublisher(for: url)
            // Maps the result to check for a valid HTTP response and extracts the data.
            .tryMap { element -> Data in
                // Ensure the response is an HTTPURLResponse and has a status code in the 200-299 range.
                // Throw an error if the response is invalid.
                guard let response = element.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            // Decodes the response data into the expected type T using a JSONDecoder.
            .decode(type: T.self, decoder: JSONDecoder())
            // Erases the type of the publisher to return AnyPublisher.
            .eraseToAnyPublisher()
    }
}
