import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension ShapeToken {
    static var roundL: Self {
        Self(
            cornerRadius: 20,
            kind: .round
        )
    }
    static var roundM: Self {
        Self(
            cornerRadius: 16,
            kind: .round
        )
    }
    static var roundS: Self {
        Self(
            cornerRadius: 12,
            kind: .round
        )
    }
    static var roundXl: Self {
        Self(
            cornerRadius: 24,
            kind: .round
        )
    }
    static var roundXs: Self {
        Self(
            cornerRadius: 8,
            kind: .round
        )
    }
    static var roundXxl: Self {
        Self(
            cornerRadius: 32,
            kind: .round
        )
    }
    static var roundXxs: Self {
        Self(
            cornerRadius: 4,
            kind: .round
        )
    }
}
