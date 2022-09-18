//
//  FontModifier.swift
//  Core
//
//  Created by Praveen Prabhakar on 12/09/22.
//

import SwiftUI

public struct FontModifier: ViewModifier {
    let themeValue: ColorSchemaValue<Font>?
    @Environment(\.colorScheme) var colorScheme

    public init(themeValue: ColorSchemaValue<Font>?) {
        self.themeValue = themeValue
    }

    public func body(content: Content) -> some View {
        Group {
            if themeValue != nil {
                content.font(themeValue?.value(colorScheme))
            }
            else {
                content
            }
        }
    }
}

public extension View {
/// Call this function to set the Color's based on ``ColorSchemaValue``
/// - Parameters:
///   - name: Configured `ligh` and `dark` mode value for `Font`
/// - Returns: Modified ``View`` that incorporates the view modifier.
    func setThemeFont(_ font: ColorSchemaValue<Font>?) -> some View {
        return modifier(FontModifier(themeValue: font))
    }
}
