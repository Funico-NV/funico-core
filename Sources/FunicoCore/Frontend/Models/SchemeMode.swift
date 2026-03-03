//
//  SchemeMode.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 03/03/2026.
//

/// Describes the visual color scheme choice for the UI.
///
/// Use this to express whether the interface should prefer a dark or light appearance,
/// or defer to system or inverse behavior.
///
/// Usage example:
/// ```swift
/// let mode: SchemeMode = .dark
/// ```
///
public enum SchemeMode {
    
    /// Forces a dark appearance.
    case dark
    /// Forces a light appearance.
    case light

    /// Uses the inverse of the current or preferred scheme.
    case inversed
    /// Follows the system or app default scheme.
    case scheme
}
