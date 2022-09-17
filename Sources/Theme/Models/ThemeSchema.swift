//
//  ThemeSchema.swift
//  Theme
//
//  Created by Praveen Prabhakar on 16/09/22.
//

import Foundation

struct ThemeSchema: Codable {
    struct FontSchema: Codable {
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
    var fonts: [String: FontSchema]?
    var styles: [String: CustomStyle]?
}
