//
//  VehicleListViewModel.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI
import Combine

enum SortVehicleOption {
    case vin, type
}

final class VehicleListViewModel: ObservableObject {
    private(set) var vehicles = [Vehicle]()

    var size: Int?
    var sortItem = SortVehicleOption.vin {
        didSet {
            resortVehicles()
        }
    }
    var cancellable = Set<AnyCancellable>()

    func performVehiclesSearch() {
        guard size != nil else { return }
        VehiclesAPI().fetchVehiclesList(size: size!)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { status in
                    switch status {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error \(error)")
                    }
                },
                receiveValue: { response in
                    self.vehicles = response
                    self.resortVehicles()
                }
            )
            .store(in: &cancellable)
    }

    func resortVehicles() {
        self.vehicles.sort(by: { sortItem == .vin ? $0.vin < $1.vin : $0.carType < $1.carType })
        objectWillChange.send()
    }
}
