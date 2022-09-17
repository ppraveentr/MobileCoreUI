//
//  ContentView.swift
//  ExampleApp
//
//  Created by Praveen Prabhakar on 03/09/22.
//

import Core
import SwiftUI
import Theme

struct ContentView: View {
    var themeColor: ColorSchemaValue<Color> {
        ColorSchemaValue(light: .blue, dark: .red)
    }
    var themeFont: ColorSchemaValue<Font> {
        ColorSchemaValue(light: .largeTitle, dark: .headline)
    }

    var body: some View {
        VStack {
            Text("Value based on group's foregroundColor: Green")
                .padding(10)
                .setThemeStyle("")
            Text("Red in LightMode and White in DarkMode")
                .padding(10)
                .setThemeStyle("Text15R")
//                .background(.yellow, in: Rectangle())
            Text("Blue in LightMode and Red in DarkMode")
                .setThemeColor(.foregroundColor(color: themeColor))
                .padding(10)
            Text("largeTitle in LightMode and headline in DarkMode")
                .setThemeFont(themeFont)
                .padding(10)
        }
        .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
