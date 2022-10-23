//
//  ExThemeView.swift
//  ExampleApp
//
//  Created by Praveen Prabhakar on 17/09/22.
//

import Core
import SwiftUI
import Theme

struct ExThemeView: View {
    var themeFont: ColorSchemeValue<Font> {
        ColorSchemeValue(.largeTitle, dark: .headline)
    }

    @AppStorage("isLightMode") var isLightMode: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle("Color Scheme", isOn: $isLightMode)
                .theme(themeFont)
            Text("Font as 'title' in LightMode and 'headline' in DarkMode")
                .theme(themeFont)
            Text("'Red' in LightMode and 'White' in DarkMode")
                .style("TextRW")
            Text("'Blue' in LightMode and 'Red' in DarkMode")
                .theme(.foreground(color: ColorSchemeValue(.blue, dark: .red)))
            Spacer()
        }
        .foregroundColor(.green)
        .padding(20)
        .modifier(ColorSchemeModifier(isLightMode: $isLightMode))
    }
}

struct ExThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ExThemeView()
    }
}
