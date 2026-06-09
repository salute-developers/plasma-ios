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
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downHardL", base: .downHardL)
        case .downHardM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downHardM", base: .downHardM)
        case .downHardS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downHardS", base: .downHardS)
        case .downSoftL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downSoftL", base: .downSoftL)
        case .downSoftM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downSoftM", base: .downSoftM)
        case .downSoftS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "downSoftS", base: .downSoftS)
        case .upHardL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upHardL", base: .upHardL)
        case .upHardM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upHardM", base: .upHardM)
        case .upHardS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upHardS", base: .upHardS)
        case .upSoftL:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upSoftL", base: .upSoftL)
        case .upSoftM:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upSoftM", base: .upSoftM)
        case .upSoftS:
            return ThemeTenantRegistry.shared.resolveShadow(theme: "StylesSalute", id: "upSoftS", base: .upSoftS)
        }
    }
}

