//
//  ThemeModifier.swift
//  Theme
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import SwiftUI

/// A modifier that you apply to a view or another view modifier, producing a
/// different version of the original value.
///
/// The example below combines several modifiers to create a new modifier
/// that you can use to create blue text in 'title' font:
///
///     struct ContentView: View {
///         var body: some View {
///             Text("Downtown Bus")
///                 .font(.title)
///                 .foregroundColor(Color.blue)
///         }
///     }
///
/// Instead, you can then apply the theme style to any view, similar to this:
///
///     Text("Downtown Bus")
///         .setThemeStyle("styleName")
///
/// This shows the Text View: "Downtown Bus", using custom a modifier, renders the
/// text in blue text with "Titlte" font.
/// 
public struct ThemeModifier: ViewModifier {
    let name: String

    @State private var forgroundColor: ThemeValue<Color>?
    @State private var font: ThemeValue<Font>?

    public func body(content: Content) -> some View {
        DispatchQueue.main.async { loadThemeData() }
        return content
            .modifier(FontModifier(themeValue: font))
            .setThemeColor(.foregroundColor(color: forgroundColor))
    }

    func loadThemeData() {
        forgroundColor = ThemesManager.color(name)
        font = ThemesManager.font(name)
    }
}

public extension View {
/// Call this function to set the style for the elements by using the current body
/// of the caller that will have the modifier applied to it.
/// - Parameters:
///   - name: StyleName for the element
/// - Returns: Modified ``View`` that incorporates the view modifier.
    func setThemeStyle(_ name: String) -> some View {
        modifier(ThemeModifier(name: name))
    }

/// Call this function to set the Color's based on ``ColorModifierStyle`` enum
/// - Parameters:
///   - name: Configured ``ColorModifierStyle`` theme color
/// - Returns: Modified ``View`` that incorporates the view modifier.
    func setThemeColor(_ color: ColorModifierStyle) -> some View {
        modifier(ColorModifier(themeValue: color))
    }
}
