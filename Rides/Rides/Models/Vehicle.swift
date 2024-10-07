//
//  Vehicle.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation

struct Vehicle: Decodable {

    let id: Int
    let vin: String
    let makeModel: String
    let color: String
    let carType: String

    private enum CodingKeys: String, CodingKey {
        case id
        case vin
        case makeModel = "make_and_model"
        case color
        case carType = "car_type"
    }
}
