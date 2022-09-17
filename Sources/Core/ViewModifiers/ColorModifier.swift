//
//  ColorModifier.swift
//  Core
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import SwiftUI

public enum ColorModifierStyle {
    case foregroundColor(color: ColorSchemaValue<Color>?)

    func value(_ colorScheme: ColorScheme) -> Color? {
        switch self {
        case let .foregroundColor(color):
            return color?.value(colorScheme)
        }
    }
}

public struct ColorModifier: ViewModifier {
    let themeValue: ColorModifierStyle
    @Environment(\.colorScheme) var colorScheme

    public init(themeValue: ColorModifierStyle) {
        self.themeValue = themeValue
    }

    public func body(content: Content) -> some View {
        return Group {
            let color = themeValue.value(colorScheme)
            switch themeValue {
            case .foregroundColor where color != nil:
                content.foregroundColor(color)
            default:
                content
            }
        }
    }
}

public extension View {
/// Call this function to set the Color's based on ``ColorModifierStyle`` enum
/// - Parameters:
///   - name: Configured ``ColorModifierStyle`` with ``ColorSchemaValue`` color
/// - Returns: Modified ``View`` that incorporates modifier.
    func setThemeColor(_ color: ColorModifierStyle) -> some View {
        modifier(ColorModifier(themeValue: color))
    }
}
