//
//  Vehicle.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation

// Struct representing a vehicle, conforming to the Decodable protocol for easy JSON decoding.
struct Vehicle: Decodable {

    let id: Int
    let vin: String
    let makeModel: String
    let color: String
    let carType: String
    let kilometrage: Double

    // Private enum defining the coding keys to map JSON keys to struct properties.
    private enum CodingKeys: String, CodingKey {
        case id
        case vin
        case makeModel = "make_and_model"
        case color
        case carType = "car_type"
        case kilometrage
    }
}
