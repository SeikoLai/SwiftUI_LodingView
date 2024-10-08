# LoadingView

A customizable, animated loading overlay for SwiftUI applications.

## Features

- Easy to integrate with existing SwiftUI projects
- Customizable spinner color, size, message, background, and more
- Works across iOS, macOS, tvOS, and watchOS
- Fade in/out animation
- Can be used as a view or a view modifier

## Requirements

- iOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- watchOS 6.0+
- Xcode 11.0+
- Swift 5.1+

## Installation

### Swift Package Manager

You can add LoadingView to your project using Swift Package Manager. In Xcode:

1. Go to File > Swift Packages > Add Package Dependency
2. Enter the repository URL: `https://github.com/SeikoLai/SwiftUI_LodingView.git`
3. Select the version you want to use

## Usage

There are two main ways to use the LoadingView in your SwiftUI projects:

### 1. As a View

You can use `LoadingView` directly in your SwiftUI views:

```swift
import SwiftUI
import LoadingView

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            // Your main content here
            Button("Start Loading") {
                isLoading = true
                // Simulate some work
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }
            }
            
            LoadingView(isPresented: $isLoading, message: "Processing...")
        }
    }
}
```

### 2. As a View Modifier

You can also use the `.loadingView()` modifier on any view:

```swift
import SwiftUI
import LoadingView

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        Button("Start Loading") {
            isLoading = true
            // Simulate some work
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
        .loadingView($isLoading, message: "Please wait...")
    }
}
```

## Customization

Both `LoadingView` and the `.loadingView()` modifier accept several parameters for customization:

- `isPresented`: Binding to control the visibility of the loading view
- `spinnerColor`: The color of the spinner (default: white)
- `diameter`: The diameter of the spinner (default: 30)
- `message`: The message to display below the loading indicator (default: "Loading...")
- `messageColor`: The color of the message text (default: white)
- `backgroundColor`: The background color of the loading view (default: semi-transparent black)
- `cornerRadius`: The corner radius of the loading view container (default: 10)

Example with custom options:

```swift
LoadingView(
    isPresented: $isLoading,
    spinnerColor: .blue,
    diameter: 40,
    message: "Fetching data...",
    messageColor: .white,
    backgroundColor: Color.black.opacity(0.7),
    cornerRadius: 20
)
```

Or using the modifier:

```swift
.loadingView(
    $isLoading,
    spinnerColor: .blue,
    diameter: 40,
    message: "Fetching data...",
    messageColor: .white,
    backgroundColor: Color.black.opacity(0.7),
    cornerRadius: 20
)
```

## API Reference

### LoadingView

The main view struct that displays the loading overlay.

### LoadingViewModifier

A view modifier that adds a loading overlay to any view.

### Spinner

A customizable spinning loading indicator.

### View Extension

Adds the `loadingView()` method to easily apply the loading overlay to any view.

For detailed API documentation, please refer to the inline documentation in the source files.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions to LoadingView are welcome! Please feel free to submit a Pull Request.
