import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A customizable spinning loading indicator
public struct Spinner: View {
    
    /// The color of the spinner
    private(set) var color: Color
    
    /// The diameter of the spinner
    private(set) var diameter: CGFloat
    
    /// The width of the spinner's circle
    private(set) var circleWidth: CGFloat
    
    /// An array of colors for the spinner gradient
    var colors: [Color] {
        [color,
         color.opacity(0.75),
         color.opacity(0.5),
         color.opacity(0.25)
        ]
    }
    
    /// The gradient used for the spinner's stroke
    var strokeColor: LinearGradient {
        LinearGradient(
            colors: colors,
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    /// The animation applied to the spinner
    var animation: Animation {
        Animation.linear(duration: 1).repeatForever(autoreverses: false)
    }
    
    /// The rotation effect applied to the spinner
    var rotationEffect: Angle {
        Angle(degrees: isAnimating ? 360 : 0)
    }
    
    /// State variable to control the animation
    @State private var isAnimating: Bool = false

    /// Initializes the Spinner with customizable properties
    /// - Parameters:
    ///   - color: The color of the spinner. Defaults to white.
    ///   - diameter: The diameter of the spinner. Defaults to 30.
    ///   - circleWidth: The width of the spinner's circle. Defaults to 4.
    public init(color: Color = .white,
                diameter: CGFloat = 30,
                circleWidth: CGFloat = 4) {
        self.color = color
        self.diameter = diameter
        self.circleWidth = circleWidth
    }
    
    public var body: some View {
        Circle()
            .stroke(strokeColor, lineWidth: circleWidth)
            .frame(width: diameter, height: diameter)
            .rotationEffect(rotationEffect)
            .animation(animation, value: isAnimating)
            .onAppear {
                // Delay 0.25 seconds to let spinner render at correct location and avoid incorrect animation
                DispatchQueue.main.asyncAfter(deadline: .now()+0.25) {
                    self.isAnimating.toggle()
                }
            }
    }
}
