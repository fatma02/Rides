//
//  MenuButton.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

struct DropMenuButton: View {

    var menuItemSelected: (_ item: SortVehicleOption) -> ()

    var body: some View {
        Menu {
            Text("Sort by:")
                .font(.subheadline)
            Button(action: {
                menuItemSelected(.vin)
            }) {
                Text("Vin")
            }
            
            Button(action: {
                menuItemSelected(.type)
            }) {
                Text("Type")
            }
        } label: {
            Image(systemName: "line.horizontal.3.decrease")
                .padding(8)
        }
        .padding()
        .frame(width: 40, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.accentColor, lineWidth: 2)
        )
    }
}
