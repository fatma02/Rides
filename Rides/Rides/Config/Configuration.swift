//
//  Configuration.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation

enum EnvConfig: String {

    enum ConfigError: Error {
        case missingKey
    }

    case VEHICLE_HOST

    static func value(_ key: EnvConfig) throws -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String
        else {
            throw ConfigError.missingKey
        }
        return value
    }
}
