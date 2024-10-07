//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI
import Combine

// Enumeration representing the sorting options for vehicles.
enum SortVehicleOption {
    case vin, type
}

// ViewModel class responsible for managing the vehicle list and handling sorting and network requests.
final class VehicleListViewModel: ObservableObject {

    // An array to store the fetched vehicle objects, initialized as an empty array.
    private(set) var vehicles = [Vehicle]()
    // Optional size parameter to determine the number of vehicles to fetch.
    var size: Int?
    // Selected sorting option, default is to sort by VIN.
    var sortItem = SortVehicleOption.vin {
        // When the sorting option is changed, resort the vehicles array.
        didSet {
            resortVehicles()
        }
    }

    // A set of cancellables to store subscriptions and manage memory.
    var cancellable = Set<AnyCancellable>()

    // Function to perform the search for vehicles, using the VehiclesAPI.
    func performVehiclesSearch() throws {
        // Check if the size is within the allowed range of 1 to 100.
        // Throw an error if the size is out of range.
        guard let size = size, (1...100).contains(size) else {
            throw SearchError.numNotInRange
        }
        // Fetch the vehicle list from the API, using Combine for asynchronous handling.
        VehiclesAPI().fetchVehiclesList(size: size)
        // Ensure the result is processed on the main thread.
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { status in
                    switch status {
                    case .finished:
                        // No further action needed if the request is successful.
                        break
                    case .failure(let error):
                        // Print the error if the request fails.
                        print("Error \(error)")
                    }
                },
                receiveValue: { response in
                    // On success, update the vehicles array with the fetched data.
                    self.vehicles = response
                    // Resort the vehicles based on the selected sort option.
                    self.resortVehicles()
                }
            )
            .store(in: &cancellable) // Store the subscription to avoid memory leaks.
    }

    // Function to resort the vehicles based on the selected sorting option.
    func resortVehicles() {
        // Sort by VIN if the selected option is .vin, otherwise sort by car type.
        self.vehicles.sort(by: { sortItem == .vin ? $0.vin < $1.vin : $0.carType < $1.carType })
        // Notify observers that the object has changed and should update the view.
        objectWillChange.send()
    }
}

// Enumeration representing possible errors during the search process.
enum SearchError: Error {
    case numNotInRange // Error for when the number is not in the allowed range.

    // Provide a user-friendly error message for each case.
    var localizedDescription: String {
        switch self {
        case .numNotInRange:
            return "Please insert a number between 1 & 100!" // Error message for size out of range. Should be moved to Localizable file or Error Messages file.
        }
    }
}
