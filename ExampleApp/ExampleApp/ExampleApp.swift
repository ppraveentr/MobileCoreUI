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
        guard let themeModel = try? Data.contentOfFile("Theme.json") else { return }
        try? ThemesManager.loadThemeModel(themeModel)
    }
}
