//
//  Configuration.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import Foundation

// An enumeration that represents environment configuration keys used in the app.
enum EnvConfig: String {

    // Enumeration case for the vehicle host configuration key.
    case VEHICLE_HOST

    // Function to retrieve the value associated with a given configuration key.
    static func value(_ key: EnvConfig) throws -> String {
        // Attempt to get the value from the app's Info.plist using the raw value of the enum case.
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            // Throw an error if the key is not found.
            throw ConfigError.missingKey
        }
        // Return the retrieved value if found.
        return value
    }
}

// An enum to define potential configuration errors.
enum ConfigError: Error {
    case missingKey
}
