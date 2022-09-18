//
//  ColorSchemeModeModifier.swift
//  Core
//
//  Created by Praveen Prabhakar on 17/09/22.
//

import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public struct ColorSchemeModeModifier: ViewModifier {

    public let isLightMode: Binding<Bool>

    public init(isLightMode: Binding<Bool>) {
        self.isLightMode = isLightMode
    }

    public func body(content: Content) -> some View {
        return content
            .preferredColorScheme(isLightMode.wrappedValue ? .light : .dark)
    }
}
