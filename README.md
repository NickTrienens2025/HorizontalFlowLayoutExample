# HorizontalFlowLayout Example

This repository demonstrates the usage of [HorizontalFlowLayout](https://github.com/NickTrienens2025/HorizontalFlowLayout), a SwiftUI layout container that automatically wraps items horizontally when they exceed the available width.

## Features

- Automatic wrapping of content to create multi-line layouts
- Support for different horizontal alignments (.leading, .trailing, .center)
- Customizable spacing between items both horizontally and vertically
- Works with SwiftUI's animation system for smooth transitions
- Perfect for tag/chip layouts, keyword displays, and any UI that needs to adapt to varying content sizes

## Examples

This example app demonstrates a dynamic tag layout that adapts to changing container widths:

- Multiple colored tags with varying lengths
- Animated container width to show the flowing behavior
- Comparison with standard HStackLayout

## Installation

To use the HorizontalFlowLayout package in your own project:

```swift
// In your Xcode project, go to:
// File > Add Packages...
// Enter the repository URL:
https://github.com/NickTrienens2025/HorizontalFlowLayout.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/NickTrienens2025/HorizontalFlowLayout.git", branch: "main")
]
```

## Usage

```swift
import SwiftUI
import HorizontalFlowLayout

struct MyView: View {
    let tags = ["SwiftUI", "Layout", "Flow", "Tags", "Wrapping"]
    
    var body: some View {
        HorizontalFlowLayout(alignment: .leading,
                         horizontalSpacing: 8,
                         verticalSpacing: 6) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(width: 300)
    }
}
```

Check out the included example app for more advanced usage patterns.

## License

Please refer to the [HorizontalFlowLayout package](https://github.com/NickTrienens2025/HorizontalFlowLayout) for license information. 