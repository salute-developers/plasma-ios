/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore


public enum Shadows {
    case downHardL
    case downHardM
    case downHardS
    case downSoftL
    case downSoftM
    case downSoftS
    case upHardL
    case upHardM
    case upHardS
    case upSoftL
    case upSoftM
    case upSoftS

    public var token: ShadowToken {
        switch self {
        case .downHardL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardL", base: .downHardL)
        case .downHardM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardM", base: .downHardM)
        case .downHardS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downHardS", base: .downHardS)
        case .downSoftL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftL", base: .downSoftL)
        case .downSoftM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftM", base: .downSoftM)
        case .downSoftS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "downSoftS", base: .downSoftS)
        case .upHardL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardL", base: .upHardL)
        case .upHardM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardM", base: .upHardM)
        case .upHardS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upHardS", base: .upHardS)
        case .upSoftL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftL", base: .upSoftL)
        case .upSoftM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftM", base: .upSoftM)
        case .upSoftS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "PlasmaB2C", id: "upSoftS", base: .upSoftS)
        }
    }
}

