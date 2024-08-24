import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A customizable loading overlay view for SwiftUI applications.
public struct LoadingView: View {
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
    
    /// Creates a new loading view.
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view.
    ///   - spinnerColor: The color of the spinner. Defaults to white.
    ///   - diameter: The diameter of the spinner. Defaults to 30.
    ///   - message: The message to display below the loading indicator. Defaults to "Loading...".
    ///   - messageColor: The color of the message text. Defaults to white.
    ///   - backgroundColor: The background color of the loading view. Defaults to semi-transparent black.
    ///   - cornerRadius: The corner radius of the loading view container. Defaults to 10.
    public init(
        isPresented: Binding<Bool>,
        spinnerColor: Color = .white,
        diameter: CGFloat = 30,
        message: String = "Loading...",
        messageColor: Color = .white,
        backgroundColor: Color = Color.black.opacity(0.25),
        cornerRadius: CGFloat = 10
    ) {
        self._isPresented = isPresented
        self.spinnerColor = spinnerColor
        self.diameter = diameter
        self.message = message
        self.messageColor = messageColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        ZStack {
            // Semi-transparent background covering the entire screen
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Custom spinner view
                Spinner(color: spinnerColor, diameter: diameter)
                    .padding(.bottom, message.isEmpty ? 0 : 20)
                
                if !message.isEmpty {
                    // Loading message
                    Text(message)
                        .font(.headline)
                        .foregroundColor(messageColor)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(minWidth: 120, minHeight: 120)
            .padding(20)
            .background(Color.black.opacity(0.75))
            .cornerRadius(cornerRadius)
        }
        // Fade in/out animation when showing/hiding the loading view
        .opacity(isPresented ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: isPresented)
    }
}
