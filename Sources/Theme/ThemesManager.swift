//
//  ThemesManager.swift
//  Themes
//
//  Created by Praveen Prabhakar on 03/09/22.
//

import Foundation

public typealias ThemeModel = [String: Any]

public struct ModelData {
    enum Style {
        case dark, light, auto
    }
    var data: ThemeModel
    var style: Style = .auto
}

public class ThemesManager: ObservableObject {
    public static let shared = ThemesManager()
    private var lightModeTheme: ThemeModel?
    private var darkModeTheme: ThemeModel?
    
    private init() {}
    
    let dispatchQueue = DispatchQueue(label: "themes.loader", qos: .userInitiated)
    
    public func loadThemeModel(_ modelData: ModelData) {
        if modelData.style == .dark {
            darkModeTheme = modelData.data
        } else {
            lightModeTheme = modelData.data
        }
    }
}
