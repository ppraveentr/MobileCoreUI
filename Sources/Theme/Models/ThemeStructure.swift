//
//  ThemeStructure.swift
//  Theme
//
//  Created by Praveen Prabhakar on 16/09/22.
//

import Foundation
import SwiftUI

struct ThemeStructure: Codable {
    struct FontStyle: Codable {
        var size: CGFloat?
        /// Based on ``Font/Weight``
        var weight: String?
        /// Based on ``Font/TextStyle``
        var styleName: String?
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

extension ThemeStructure.FontStyle {
/// Generate ``Font`` based on `styleName`
    var fromStyleName: Font? {
        guard let styleName else { return nil }
        switch styleName {
        case "largeTitle":
            return .largeTitle
        case "title":
            return .title
        case "title2":
            if #available(iOS 14.0, *) {
                return .title2
            } else {
                return .title
            }
        case "title3":
            if #available(iOS 14.0, *) {
                return .title3
            } else {
                return .title
            }
        case "headline":
            return .headline
        case "subheadline":
            return .subheadline
        case "body":
            return .body
        case "callout":
            return .callout
        case "footnote":
            return .footnote
        case "caption":
            return .caption
        case "caption2":
            if #available(iOS 14.0, *) {
                return .caption2
            } else {
                return .caption
            }
        default:
            return nil
        }
    }

/// Generate ``Font`` based on `size: CGFloat` and ``Font/Weight``
    var fromSize: Font? {
        guard let size else { return nil }
        return Font.system(size: size, weight: fontWight)
    }

/// Generate ``Font/Weight`` based on `weight`
    var fontWight: Font.Weight {
        switch weight {
        case "ultraLight":
            return .ultraLight
        case "thin":
            return .thin
        case "light":
            return .light
        case "medium":
            return .medium
        case "semibold":
            return .semibold
        case "bold":
            return .bold
        case "heavy":
            return .heavy
        case "black":
            return .black
        default:
            return .regular
        }
    }
}
