//
//  CustomSearchBar.swift
//  Rides
//
//  Created by Fatma Fitouri on 4/10/2024.
//

import SwiftUI

// Custom view for a search bar that allows the user to input a size and perform a search.
struct CustomSearchBar: View {

    // Binding to an optional integer that represents the size input by the user.
    @Binding var size: Int?
    // Closure that is called when the search button is tapped.
    var searchTapped: () -> ()
    // Closure that is called when a menu item is selected from the dropdown.
    var menuItemSelected: (_ item: SortVehicleOption) -> ()

    var body: some View {
        // Horizontal stack to arrange the search bar components.
        HStack {
            // Inner horizontal stack for the text field and search button.
            HStack {
                // TextField for user input, formatted as a number.
                TextField("10", value: $size, format: .number)
                    .padding() // Add padding around the text field.
                    .frame(height: 40) // Set the height of the text field.
                    .keyboardType(.numberPad) // Show number pad for input.
                    .foregroundStyle(Color.accentColor) // Set the text color to accent color.
                // Button to trigger the search action.
                Button(action: {
                    // Trigger the search when the button is tapped
                    searchTapped()
                }) {
                    // Search icon displayed in the button.
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.accentColor) // Set icon color to accent color.
                }
                .frame(width: 40, height: 40)
            }
            .background(
                // Rounded rectangle background for the text field and button.
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            // Dropdown menu button for selecting sorting options.
            DropMenuButton(menuItemSelected: menuItemSelected)
        }
        // Add padding around the entire search bar.
        .padding(8)
    }
}
