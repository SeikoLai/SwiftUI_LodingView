//
//  Modifier+Extension.swift
//
//
//  Created by Sam on 2024/8/24.
//

import SwiftUI

/// Extension on ViewModifier to provide a convenient static method for creating a LoadingViewModifier
extension ViewModifier where Self == LoadingViewModifier {
    /// Creates a LoadingViewModifier with customizable properties
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view
    ///   - spinnerColor: The color of the spinner (default: white)
    ///   - message: The message to display below the loading indicator (default: "Loading...")
    ///   - messageColor: The color of the message text (default: white)
    ///   - backgroundColor: The background color of the loading view (default: semi-transparent black)
    ///   - cornerRadius: The corner radius of the loading view container (default: 10)
    /// - Returns: A LoadingViewModifier instance
    public static func loadingView(_ isPresented: Binding<Bool>,
                                   spinnerColor: Color = .white,
                                   message: String = "Loading...",
                                   messageColor: Color = .white,
                                   backgroundColor: Color = Color.black.opacity(0.25),
                                   cornerRadius: CGFloat = 10) -> LoadingViewModifier {
        LoadingViewModifier(isPresented: isPresented,
                            spinnerColor: spinnerColor,
                            message: message,
                            messageColor: messageColor,
                            backgroundColor: backgroundColor,
                            cornerRadius: cornerRadius)
    }
}
