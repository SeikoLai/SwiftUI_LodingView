# ``LoadingView``

A customizable, animated loading overlay for SwiftUI applications.

## Overview

`LoadingView` is a SwiftUI view that displays an animated loading indicator with an optional message. It's designed to be easily integrated into any SwiftUI project and works across iOS, macOS, tvOS, and watchOS platforms.

Use `LoadingView` when you need to indicate that a task is in progress and potentially block user interaction until the task is complete.

```swift
LoadingView(isPresented: $isLoading, message: "Processing...")
```

## Topics

### Essentials

- ``LoadingView/init(isPresented:message:)``

### Customizing the Loading View

- ``LoadingView/message``

### Controlling the Loading View

- ``LoadingView/isPresented``

## Usage

To use `LoadingView` in your SwiftUI view:

1. Import the LoadingView module
2. Create a state variable to control the visibility of the loading view
3. Add the `LoadingView` as an overlay to your content

Here's a basic example:

```swift
import SwiftUI
import LoadingView

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        Button("Start Task") {
            isLoading = true
            // Perform your task here
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
        .overlay(
            LoadingView(isPresented: $isLoading, message: "Loading...")
        )
    }
}
```

### Customization

You can customize the loading message by passing a different string to the `message` parameter:

```swift
LoadingView(isPresented: $isLoading, message: "Fetching data...")
```

## Topics

### Creating a Loading View

- ``LoadingView/init(isPresented:message:)``

### Properties

- ``LoadingView/isPresented``
- ``LoadingView/message``
