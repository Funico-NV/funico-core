//
//  Color.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 03/03/2026.
//

#if canImport(SwiftUI)
import SwiftUI

public extension Color {
    
    static var accentLight: Color {
        Color("AccentColor_Light", bundle: Bundle.module)
    }
    
    static var accentDark: Color {
        Color("AccentColor_Dark", bundle: Bundle.module)
    }
}

public extension Color {
    
    /// Returns the accent color for a given UI scheme and mode.
    ///
    /// The `mode` selects whether to force a specific accent or to derive one
    /// from the current `colorScheme`.
    ///
    /// - Parameters:
    ///   - colorScheme: The active SwiftUI color scheme to resolve against.
    ///   - mode: The scheme resolution mode. Defaults to `.scheme`.
    /// - Returns: The resolved accent `Color` for the given inputs.
    ///
    /// Example:
    /// ```swift
    /// let color = Color.accent(using: colorScheme, mode: .scheme)
    /// ```
    static func accent(using colorScheme: ColorScheme, mode: SchemeMode = .scheme) -> Color {
        switch mode {
        case .dark: Color.accentDark
        case .light: Color.accentLight
        case .inversed:
            switch colorScheme {
            case .light: Color.accentLight
            case .dark: Color.accentDark
            @unknown default: Color.accentLight
            }
        case .scheme:
            switch colorScheme {
            case .light: Color.accentDark
            case .dark: Color.accentLight
            @unknown default: Color.accentDark
            }
        }
    }
}
#endif
