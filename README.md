[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-SwiftUI-brightgreen.svg?style=flat)](https://developer.apple.com/xcode/swiftui)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/ppraveentr/MobileCoreUI)

[![Build Status](https://github.com/ppraveentr/MobileCoreUI/actions/workflows/on-push.yml/badge.svg)](https://github.com/ppraveentr/MobileCoreUI/actions/workflows/on-push.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=ppraveentr_MobileCoreUI&metric=alert_status)](https://sonarcloud.io/project/overview?id=ppraveentr_MobileCoreUI)


# MobileCoreUI

## Theme - Submoudle of MobileCoreUI
A way to organize and manage style across the application dynamically (dark and light mode).

### Usage
App's styles are defined thorugh a JSON file, which can loaded once app is lanched.

#### Sample - Theme.Json
```json
{
    "version": "1.0",
    "colors": {
        "white": "#FFFFFF",
        "red": "#EE4B2B"
    },
    "fonts": {
        "subHeader": { "weight": "subheadline" }
    },
    "styles": {
        "TextRW": {
            "forgroundColor": {"light": "red", "dark": "white"},
            "font": "subHeader"
        }
    }
}
```

We can load the json file into Manager as:
```swift
   guard let themeModel = try? Data.contentOfFile("Theme.json") else { return }
   try? ThemesManager.loadThemeModel(themeModel)
}
```

Configure the SwiftUI Text style as below:
```swift
    Toggle("Color Scheme", isOn: $isLightMode)
      .theme(ColorSchemeValue(.title, dark: .headline))
    Text("Font as 'title' in LightMode and 'headline' in DarkMode")
      .theme(ColorSchemeValue(.title, dark: .headline))
    Text("'Red' in LightMode and 'White' in DarkMode")
      .style("TextRW")
    Text("'Blue' in LightMode and 'Red' in DarkMode")
      .theme(.foreground(color: .init(.blue, dark: .red)))
}
```
![MobileCoreUI-Color-Font](https://user-images.githubusercontent.com/15041699/197370257-62a28cfb-4923-4451-a239-8f0cbe2ccc96.gif)
