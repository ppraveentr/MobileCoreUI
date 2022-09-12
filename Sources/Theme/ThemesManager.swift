//
//  ThemesManager.swift
//  Themes
//
//  Created by Praveen Prabhakar on 03/09/22.
//

import Foundation
import SwiftUI

public class ThemesManager: ObservableObject {
    public static let shared = ThemesManager()
    public private(set) var themeModel: ThemeValue<ThemeModel>?

    private init() { /* dummpy function */ }

/// Call this function to generate `ThemeValue: ThemeModel` async,
/// based on the `light` and `dark` json`ThemeValue: ThemeDic`
///
/// - Parameters:
///   - jsonData: `ThemeDic` JSON for `light` and `dark`
    public func loadThemeModel(_ jsonData: ThemeValue<ThemeDic>) async throws {
        let (lightJSON, darkJSON) = (jsonData.light, jsonData.dark)
        do {
            let light = try await ThemeModel.generateModel(lightJSON)
            var dark: ThemeModel?
            if let darkJSON = darkJSON {
                dark = try? await ThemeModel.generateModel(darkJSON)
            }
            themeModel = ThemeValue(light: light, dark: dark)
        }
    }
}

/// Extentions to get 'ThemeValue' based on style name
extension ThemesManager {
/// Call this function to get `ThemeValue: Color`
///
/// - Parameters:
///   - style: Name of the style to fetch
/// - Returns: Gets `light` and `dark` style value for: `Color`
    static func color(_ style: String) -> ThemeValue<Color>? {
        if style.isEmpty {
            return nil
        }
        return ThemeValue(light: .blue, dark: .red)
    }

/// Call this function to get `ThemeValue: Font`
///
/// - Parameters:
///   - style: Name of the style to fetch
/// - Returns: Gets `light` and `dark`style value for: `Font`
    static func font(_ style: String) -> ThemeValue<Font>? {
        return ThemeValue(light: .headline, dark: .title)
    }
}
