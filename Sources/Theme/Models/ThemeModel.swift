//
//  ThemeModel.swift
//  Theme
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import Core
import SwiftUI

public class ThemeModel {
    var colors = [String: Color]()
    var fonts = [String: Font]()
    var styles = [String: UserStyle]()

    struct UserStyle {
        var forgroundColor: ColorSchemeValue<Color>?
        var font: ColorSchemeValue<Font>?

        init(fcLight: Color? = nil, fcDark: Color? = nil, font: Font? = nil) {
            if let fcLight = fcLight {
                self.forgroundColor = ColorSchemeValue(light: fcLight, dark: fcDark)
            }
            if let fLight = font {
                self.font = ColorSchemeValue(light: fLight, dark: nil)
            }
        }
    }
}

extension ThemeModel {
    static func generateModel(_ jsonData: Data) throws -> ThemeModel {
        let theme = try JSONDecoder().decode(ThemeStyle.self, from: jsonData)
        var model = ThemeModel()
            // Generate Colors
        theme.colors?.forEach { model.colors[$0] = Self.colorFromValue($1) }
            // Generate Fonts
        theme.fonts?.forEach { model.fonts[$0] = Self.fontFromValue($1) }
            // Generate Theme Style
        theme.styles?.forEach { model.styles[$0] = Self.styleFromValue($1, model: model) }
        return model
    }
}
/// Generate Style value from name
private extension ThemeModel {
    static func colorFromValue(_ name: String) -> Color? {
        if name.hasPrefix("#") {
            return Color(hex: name)
        }
        return nil
    }

    static func fontFromValue(_ style: ThemeStyle.FontStyle) -> Font? {
        return nil
    }

    static func styleFromValue(_ style: ThemeStyle.UserStyle, model: ThemeModel) -> UserStyle? {
        let (fcLight, fcDark) = (model.colors[style.forgroundColor?.light ?? ""], model.colors[style.forgroundColor?.dark ?? ""])
        let font = model.fonts[style.font ?? ""]
        return UserStyle(fcLight: fcLight, fcDark: fcDark, font: font)
    }
}
