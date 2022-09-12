//
//  ThemeModel.swift
//  Theme
//
//  Created by Praveen Prabhakar on 11/09/22.
//

import SwiftUI

public typealias ThemeDic = [String: Any]

public struct ThemeValue<T> {
    public var light: T, dark: T?
    var optionalDark: T { dark ?? light }

    func value(_ colorScheme: ColorScheme) -> T {
        colorScheme == .light ? light : optionalDark
    }
}

public struct ThemeModel {
    public private(set) var data: ThemeDic

    init(data: ThemeDic) {
        self.data = data
    }

    static func generateModel(_ data: ThemeDic) async throws -> Self {
        ThemeModel(data: data)
    }
}
