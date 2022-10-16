//
//  ExampleApp.swift
//  ExampleApp
//
//  Created by Praveen Prabhakar on 03/09/22.
//

import Theme
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await loadThemeModel()
                }
        }
    }

    func loadThemeModel() async {
        guard let lightTheme = try? Data.contentOfFile("Theme.json") else { return }
        try? ThemesManager.shared.loadThemeModel(lightTheme)
    }

    func themeData(_ name: String) throws -> Data? {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else { return nil }
        return try Data(contentsOf: url)
    }
}
