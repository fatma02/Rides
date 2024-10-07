//
//  VehiclesAPI.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation
import Combine

protocol VehiclesFetchable {
    func fetchVehiclesList(size: Int) -> AnyPublisher<[Vehicle], Error>
}

class VehiclesAPI {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension VehiclesAPI {
    func urlComponentForVehiclesList(size: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = try? EnvConfig.value(EnvConfig.VEHICLE_HOST)
        components.path = "/api/vehicle/random_vehicle/"
        components.queryItems = [
          URLQueryItem(name: "size", value: "\(size)"),
        ]
        return components
    }
}

extension VehiclesAPI: VehiclesFetchable, Fetchable {

    func fetchVehiclesList(size: Int) -> AnyPublisher<[Vehicle], any Error> {
        return fetch(with: urlComponentForVehiclesList(size: size).url!, session: session)
    }
}
