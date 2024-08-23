// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A customizable loading overlay view for SwiftUI applications.
public struct LoadingView: View {
    /// Binding to control the visibility of the loading view.
    @Binding public var isPresented: Bool
    
    /// The message to display below the loading indicator.
    public var message: String
    
    /// The color of the loading indicator and text.
    public var color: Color
    
    /// The background color of the loading view.
    public var backgroundColor: Color
    
    /// The corner radius of the loading view container.
    public var cornerRadius: CGFloat
    
    /// Creates a new loading view.
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the loading view.
    ///   - message: The message to display below the loading indicator.
    ///   - color: The color of the loading indicator and text. Defaults to white.
    ///   - backgroundColor: The background color of the loading view. Defaults to black with opacity.
    ///   - cornerRadius: The corner radius of the loading view container. Defaults to 10.
    public init(
        isPresented: Binding<Bool>,
        message: String = "Loading...",
        color: Color = .white,
        backgroundColor: Color = Color.black.opacity(0.6),
        cornerRadius: CGFloat = 10
    ) {
        self._isPresented = isPresented
        self.message = message
        self.color = color
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: color))
                    .scaleEffect(1.5)
                    .padding(.bottom, 20)
                
                Text(message)
                    .font(.headline)
                    .foregroundColor(color)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(cornerRadius)
        }
        .opacity(isPresented ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: isPresented)
    }
}
