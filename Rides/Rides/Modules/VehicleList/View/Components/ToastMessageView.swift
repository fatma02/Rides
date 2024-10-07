//
//  ToastMessageView.swift
//  Rides
//
//  Created by Fatma Fitouri on 6/10/2024.
//

import SwiftUI

// A view that displays a toast message for notifications or errors.
struct ToastMessageView: View {

    // The message to be displayed in the toast.
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .padding()
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 40)
        }
    }
}
