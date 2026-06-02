/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension ShapeToken {
    static var roundL: Self {
        let base = Self(
            cornerRadius: 16.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundL", base: base)
    }
    static var roundM: Self {
        let base = Self(
            cornerRadius: 12.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundM", base: base)
    }
    static var roundS: Self {
        let base = Self(
            cornerRadius: 8.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundS", base: base)
    }
    static var roundXl: Self {
        let base = Self(
            cornerRadius: 20.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundXl", base: base)
    }
    static var roundXs: Self {
        let base = Self(
            cornerRadius: 6.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundXs", base: base)
    }
    static var roundXxl: Self {
        let base = Self(
            cornerRadius: 32.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundXxl", base: base)
    }
    static var roundXxs: Self {
        let base = Self(
            cornerRadius: 4.0,
            kind: .round
        )
        return ThemeTenantRegistry.shared.resolveShape(theme: "PlasmaHomeDS", id: "roundXxs", base: base)
    }
}
