//
//  VehicleItem.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct VehicleItem: View {

    let titleText: String
    let subTitleText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(titleText)
                .font(.headline)
                .foregroundColor(.primary)
            Text(subTitleText)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
