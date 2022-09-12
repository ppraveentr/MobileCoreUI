//
//  ColorModifier.swift
//  Theme
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import SwiftUI

public enum ColorModifierStyle {
    case foregroundColor(color: ThemeValue<Color>?)

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
