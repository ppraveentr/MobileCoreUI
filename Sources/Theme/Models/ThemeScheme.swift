//
//  ThemeScheme.swift
//  Theme
//
//  Created by Praveen Prabhakar on 16/09/22.
//

import Foundation

struct ThemeScheme: Codable {
    struct FontScheme: Codable {
        var size: Float
        var weight: String?
    }

    struct ColorMode: Codable {
        var light: String
        var dark: String?
    }

    struct CustomStyle: Codable {
        var forgroundColor: ColorMode?
        var font: String?
    }

    var colors: [String: String]?
    var fonts: [String: FontScheme]?
    var styles: [String: CustomStyle]?
}
