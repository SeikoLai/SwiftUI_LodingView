import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A view modifier that adds a loading overlay to any view
public struct LoadingViewModifier: ViewModifier {
    
    /// Binding to control the visibility of the loading view.
    @Binding public var isPresented: Bool
    
    /// The color of the spinner.
    public var spinnerColor: Color
    
    /// The diameter of the spinner.
    public var diameter: CGFloat
    
    /// The message to display below the loading indicator.
    public var message: String
    
    /// The color of the message text.
    public var messageColor: Color
    
    /// The background color of the loading view.
    public var backgroundColor: Color
    
    /// The corner radius of the loading view container.
    public var cornerRadius: CGFloat
    
    /// Initializes the LoadingViewModifier with customizable properties
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view.
    ///   - spinnerColor: The color of the spinner. Defaults to white.
    ///   - diameter: The diameter of the spinner. Defaults to 30.
    ///   - message: The message to display below the loading indicator. Defaults to empty string.
    ///   - messageColor: The color of the message text. Defaults to white.
    ///   - backgroundColor: The background color of the loading view. Defaults to semi-transparent black.
    ///   - cornerRadius: The corner radius of the loading view container. Defaults to 10.
    public init(isPresented: Binding<Bool>,
                spinnerColor: Color = .white,
                diameter: CGFloat = 30,
                message: String = "",
                messageColor: Color = .white,
                backgroundColor: Color = Color.black.opacity(0.25),
                cornerRadius: CGFloat = 10) {
        self._isPresented = isPresented
        self.spinnerColor = spinnerColor
        self.diameter = diameter
        self.message = message
        self.messageColor = messageColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    /// Applies the loading view modifier to the content
    /// - Parameter content: The content to which the loading view is applied
    /// - Returns: A view with the loading overlay applied
    public func body(content: Content) -> some View {
        ZStack {
            // The original content
            content
                .zIndex(isPresented ? -1 : 0)  // Push content behind loading view when loading
            
            // Show loading view when isPresented is true
            if isPresented {
                LoadingView(isPresented: $isPresented,
                            spinnerColor: spinnerColor,
                            diameter: diameter,
                            message: message,
                            messageColor: messageColor,
                            backgroundColor: backgroundColor,
                            cornerRadius: cornerRadius)
                .zIndex(.greatestFiniteMagnitude)  // Ensure loading view is always on top
            }
        }
    }
}
