//
//  Severity.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 11/03/2026.
//

import Foundation

/// Indicates the severity level for backend errors and operational events.
///
/// Use this type to communicate whether an issue is routine or requires immediate attention.
///
/// Example:
/// ```swift
/// let severity: Severity = .critical
/// ```
public enum Severity {
    /// A routine, non-urgent condition.
    case normal
    /// A high-impact condition requiring immediate attention.
    case critical
}
