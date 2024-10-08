import SwiftUI

/// Extension on View to provide a convenient method for applying the LoadingViewModifier
public extension View {
    /// Applies a loading overlay to the view with customizable properties
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view
    ///   - spinnerColor: The color of the spinner (default: white)
    ///   - diameter: The diameter of the spinner (default: 30)
    ///   - message: The message to display below the loading indicator (default: empty string)
    ///   - messageColor: The color of the message text (default: white)
    ///   - backgroundColor: The background color of the loading view (default: semi-transparent black)
    ///   - cornerRadius: The corner radius of the loading view container (default: 10)
    /// - Returns: A view with the LoadingViewModifier applied
    func loadingView(_ isPresented: Binding<Bool>,
                     spinnerColor: Color = .white,
                     diameter: CGFloat = 30,
                     message: String = "",
                     messageColor: Color = .white,
                     backgroundColor: Color = Color.black.opacity(0.25),
                     cornerRadius: CGFloat = 10) -> some View {
        modifier(LoadingViewModifier(isPresented: isPresented,
                                     spinnerColor: spinnerColor,
                                     diameter: diameter,
                                     message: message,
                                     messageColor: messageColor,
                                     backgroundColor: backgroundColor,
                                     cornerRadius: cornerRadius))
    }
}
