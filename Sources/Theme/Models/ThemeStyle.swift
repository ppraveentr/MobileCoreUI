//
//  ThemeStyle.swift
//  Theme
//
//  Created by Praveen Prabhakar on 16/09/22.
//

import Foundation

struct ThemeStyle: Codable {
    struct FontStyle: Codable {
        var size: Float
        var weight: String?
    }

    struct ColorStyle: Codable {
        var light: String
        var dark: String?
    }

    struct UserStyle: Codable {
        var forgroundColor: ColorStyle?
        var font: String?
    }

    var colors: [String: String]?
    var fonts: [String: FontStyle]?
    var styles: [String: UserStyle]?
}
