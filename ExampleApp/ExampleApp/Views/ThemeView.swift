//
//  ThemeView.swift
//  ExampleApp
//
//  Created by Praveen Prabhakar on 17/09/22.
//

import Core
import SwiftUI
import Theme

struct ThemeView: View {
    var themeColor: ColorSchemeValue<Color> {
        ColorSchemeValue(light: .blue, dark: .red)
    }
    var themeFont: ColorSchemeValue<Font> {
        ColorSchemeValue(light: .largeTitle, dark: .headline)
    }

    @AppStorage("isLightMode") var isLightMode: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Toggle("Color Scheme", isOn: $isLightMode)
                .foregroundColor(.blue)
                .padding(.bottom, 40)
            Text("Value based on group's foregroundColor: Green")
                .setThemeStyle("")
            Text("Red in LightMode and White in DarkMode")
                .setThemeStyle("Text15R")
            Text("Blue in LightMode and Red in DarkMode")
                .setThemeColor(.foregroundColor(color: themeColor))
            Text("Font as 'largeTitle' in LightMode and 'headline' in DarkMode")
                .setThemeFont(themeFont)
            Spacer()
        }
        .foregroundColor(.green)
        .padding(20)
        .modifier(ColorSchemeModeModifier(isLightMode: $isLightMode))
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
