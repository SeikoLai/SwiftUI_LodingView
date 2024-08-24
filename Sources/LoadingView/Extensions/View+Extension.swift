//
//  View+Extension.swift
//
//
//  Created by Sam on 2024/8/24.
//

import SwiftUI

/// Extension on View to provide a convenient method for applying the LoadingViewModifier
public extension View {
    /// Applies a loading overlay to the view with customizable properties
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view
    ///   - spinnerColor: The color of the spinner (default: white)
    ///   - message: The message to display below the loading indicator (default: "Loading...")
    ///   - messageColor: The color of the message text (default: white)
    ///   - backgroundColor: The background color of the loading view (default: semi-transparent black)
    ///   - cornerRadius: The corner radius of the loading view container (default: 10)
    /// - Returns: A view with the LoadingViewModifier applied
    public func loadingView(_ isPresented: Binding<Bool>,
                            spinnerColor: Color = .white,
                            message: String = "Loading...",
                            messageColor: Color = .white,
                            backgroundColor: Color = Color.black.opacity(0.25),
                            cornerRadius: CGFloat = 10) -> some View {
        modifier(loadingViewModifier(isPresented: isPresented,
                                     spinnerColor: spinnerColor,
                                     message: message,
                                     messageColor: messageColor,
                                     backgroundColor: backgroundColor,
                                     cornerRadius: cornerRadius))
    }
}
