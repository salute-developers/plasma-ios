/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore


public enum Shapes {
    case roundL
    case roundM
    case roundS
    case roundXl
    case roundXs
    case roundXxl
    case roundXxs

    public var token: ShapeToken {
        switch self {
        case .roundL:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundL", base: .roundL)
        case .roundM:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundM", base: .roundM)
        case .roundS:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundS", base: .roundS)
        case .roundXl:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundXl", base: .roundXl)
        case .roundXs:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundXs", base: .roundXs)
        case .roundXxl:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundXxl", base: .roundXxl)
        case .roundXxs:
            return ThemeTenantRegistry.shared.resolveShape(theme: "StylesSalute", id: "roundXxs", base: .roundXxs)
        }
    }
}

