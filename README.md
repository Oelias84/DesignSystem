# DesignSystem

A Swift Package design system for iPhone apps: color tokens, typography, and reusable SwiftUI components.

## Requirements

- iOS 18+
- Swift 6

## Installation

Add via Swift Package Manager, pinned to an exact version:

```
https://github.com/Oelias84/DesignSystem
```

In Xcode: **File → Add Package Dependencies**, paste the URL above, and select "Exact Version" pointing at the latest tag.

## Usage

### Colors

```swift
import DesignSystem

Text("Hello")
    .foregroundStyle(Color.main)
    .background(Color.lightGray)
```

Available tokens: `Color.main`, `.dark`, `.dsGreen`, `.lightGray`.

### Typography

```swift
Text("Title").font(DSFont.heading1)
Text("Body").font(DSFont.heading2Regular)
```

Available styles: `DSFont.heading1`, `.heading2`, `.heading2Medium`, `.heading2Regular`, `.caption`.

### Buttons

```swift
Button("Continue") { }
    .buttonStyle(.primary)

Button("Open Receipt") { }
    .buttonStyle(.cartButton(type: .receipt))
```

### Text field / labeled display

```swift
TextField("Email", text: $email)
    .dsTextField(title: "Email")

DSRawView(title: "John Appleseed", caption: "Full name")
```

## Versioning

This package follows [Semantic Versioning](https://semver.org/): patch releases (`1.0.x`) are bug fixes, minor releases (`1.x.0`) add functionality without breaking existing usage, major releases (`x.0.0`) contain breaking API changes.

## Contributing

Work happens on `develop`, merged to `main` for release. Tag a new version on `main` after merging.
