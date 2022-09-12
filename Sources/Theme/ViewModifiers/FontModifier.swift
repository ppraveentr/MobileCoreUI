//
//  FontModifier.swift
//  Theme
//
//  Created by Praveen Prabhakar on 12/09/22.
//

import SwiftUI

public struct FontModifier: ViewModifier {
    let themeValue: ThemeValue<Font>?
    @Environment(\.colorScheme) var colorScheme

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
