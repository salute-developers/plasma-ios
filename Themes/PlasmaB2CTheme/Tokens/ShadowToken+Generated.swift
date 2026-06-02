/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension ShadowToken {
    static var downHardL: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000066")),
                    offsetX: 0.0,
                    offsetY: 60.0,
                    blurRadius: 112.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardL", base: base)
    }
    static var downHardM: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#0000003D")),
                    offsetX: 0.0,
                    offsetY: 16.0,
                    blurRadius: 32.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardM", base: base)
    }
    static var downHardS: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#08080829")),
                    offsetX: 0.0,
                    offsetY: 4.0,
                    blurRadius: 12.0,
                    spreadRadius: -3.0
                ),
                Self.Layer(
                    color: Color(UIColor(hex: "#00000014")),
                    offsetX: 0.0,
                    offsetY: 1.0,
                    blurRadius: 4.0,
                    spreadRadius: -2.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardS", base: base)
    }
    static var downSoftL: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000014")),
                    offsetX: 0.0,
                    offsetY: 60.0,
                    blurRadius: 112.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftL", base: base)
    }
    static var downSoftM: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000014")),
                    offsetX: 0.0,
                    offsetY: 24.0,
                    blurRadius: 48.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftM", base: base)
    }
    static var downSoftS: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#08080814")),
                    offsetX: 0.0,
                    offsetY: 4.0,
                    blurRadius: 14.0,
                    spreadRadius: -4.0
                ),
                Self.Layer(
                    color: Color(UIColor(hex: "#0000000A")),
                    offsetX: 0.0,
                    offsetY: 1.0,
                    blurRadius: 4.0,
                    spreadRadius: -1.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftS", base: base)
    }
    static var upHardL: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000066")),
                    offsetX: 0.0,
                    offsetY: -60.0,
                    blurRadius: 112.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardL", base: base)
    }
    static var upHardM: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#0000003D")),
                    offsetX: 0.0,
                    offsetY: -16.0,
                    blurRadius: 32.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardM", base: base)
    }
    static var upHardS: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#08080833")),
                    offsetX: 0.0,
                    offsetY: -4.0,
                    blurRadius: 12.0,
                    spreadRadius: -3.0
                ),
                Self.Layer(
                    color: Color(UIColor(hex: "#00000008")),
                    offsetX: 0.0,
                    offsetY: -1.0,
                    blurRadius: 4.0,
                    spreadRadius: -1.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardS", base: base)
    }
    static var upSoftL: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000014")),
                    offsetX: 0.0,
                    offsetY: -60.0,
                    blurRadius: 112.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftL", base: base)
    }
    static var upSoftM: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#00000014")),
                    offsetX: 0.0,
                    offsetY: -24.0,
                    blurRadius: 48.0,
                    spreadRadius: -8.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftM", base: base)
    }
    static var upSoftS: Self {
        let base = Self(
            layers: [
                Self.Layer(
                    color: Color(UIColor(hex: "#08080814")),
                    offsetX: 0.0,
                    offsetY: -4.0,
                    blurRadius: 14.0,
                    spreadRadius: -4.0
                ),
                Self.Layer(
                    color: Color(UIColor(hex: "#00000008")),
                    offsetX: 0.0,
                    offsetY: -1.0,
                    blurRadius: 4.0,
                    spreadRadius: -1.0
                )
            ]
        )
        return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftS", base: base)
    }
}
