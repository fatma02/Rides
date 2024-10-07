//
//  VehiclesAPI.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation
import Combine

// Protocol defining a method for fetching a list of vehicles.
protocol VehiclesFetchable {
    // Method to fetch a list of vehicles, taking a size parameter and returning a publisher that emits an array of Vehicle objects or an Error.
    func fetchVehiclesList(size: Int) -> AnyPublisher<[Vehicle], Error>
}

// API class responsible for handling network requests to fetch vehicle data.
class VehiclesAPI {
    // URLSession instance used to perform network requests.
    private let session: URLSession
    // Initializer with an optional URLSession parameter, defaulting to the shared URLSession.
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension VehiclesAPI {
    // Helper method to create URLComponents for the vehicle list request.
    // Takes a size parameter to specify the number of vehicles to fetch.
    func urlComponentForVehiclesList(size: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https" // Use HTTPS for the URL scheme.
        // Retrieve the host from environment configuration using EnvConfig.
        components.host = try? EnvConfig.value(EnvConfig.VEHICLE_HOST)
        // Set the path for the vehicle API endpoint.
        components.path = "/api/vehicle/random_vehicle/"
        // Add the size query parameter to the URL.
        components.queryItems = [
          URLQueryItem(name: "size", value: "\(size)"),
        ]
        return components
    }
}

// Extension to conform VehiclesAPI to both VehiclesFetchable and Fetchable protocols.
extension VehiclesAPI: VehiclesFetchable, Fetchable {
    // Method to fetch the vehicle list, using the fetch method from the Fetchable protocol.
    // Constructs the URL using the urlComponentForVehiclesList method and returns a publisher that emits an array of Vehicle objects or an Error.
    func fetchVehiclesList(size: Int) -> AnyPublisher<[Vehicle], any Error> {
        return fetch(with: urlComponentForVehiclesList(size: size).url!, session: session)
    }
}
