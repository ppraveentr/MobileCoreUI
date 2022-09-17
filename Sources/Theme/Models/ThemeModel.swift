//
//  ThemeModel.swift
//  Theme
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import Core
import SwiftUI

public struct ThemeModel {
    var colors = [String: Color]()
    var fonts = [String: Font]()
    var styles = [String: UserStyle]()

    struct UserStyle {
        var forgroundColor: ColorSchemaValue<Color>?
        var font: ColorSchemaValue<Font>?

        init(fcLight: Color? = nil, fcDark: Color? = nil, font: Font? = nil) {
            if let fcLight = fcLight {
                self.forgroundColor = ColorSchemaValue(light: fcLight, dark: fcDark)
            }
            if let fLight = font {
                self.font = ColorSchemaValue(light: fLight, dark: nil)
            }
        }
    }
}

extension ThemeModel {
    static func generateModel(_ jsonData: Data) throws -> Self {
        let theme = try JSONDecoder().decode(ThemeSchema.self, from: jsonData)
        var model = ThemeModel()
        // Generate Colors
        theme.colors?.forEach { model.colors[$0] = Self.colorFromValue($1) }
        // Generate Fonts
        theme.fonts?.forEach { model.fonts[$0] = Self.fontFromValue($1) }
        // Generate Theme Style
        theme.styles?.forEach { model.styles[$0] = Self.styleFromValue($1, model: model) }
        return model
    }

    private static func colorFromValue(_ name: String) -> Color? {
        if name.hasPrefix("#") {
            return Color(hex: name)
        }
        return nil
    }

    private static func fontFromValue(_ style: ThemeSchema.FontSchema) -> Font? {
        return nil
    }

    private static func styleFromValue(_ style: ThemeSchema.CustomStyle, model: ThemeModel) -> UserStyle? {
        let (fcLight, fcDark) = (model.colors[style.forgroundColor?.light ?? ""], model.colors[style.forgroundColor?.dark ?? ""])
        let font = model.fonts[style.font ?? ""]
        return UserStyle(fcLight: fcLight, fcDark: fcDark, font: font)
    }
}
