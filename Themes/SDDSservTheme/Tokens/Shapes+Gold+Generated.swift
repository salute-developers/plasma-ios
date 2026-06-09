/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore


public extension Shapes {
    static func registerGold() {
        ThemeTenantRegistry.shared.registerShapes(theme: "SDDSServ", tenant: Tenant(name: "Gold")) { id in
            switch id {
            case "roundL": return .roundLGold
            case "roundM": return .roundMGold
            case "roundS": return .roundSGold
            case "roundXl": return .roundXlGold
            case "roundXs": return .roundXsGold
            case "roundXxl": return .roundXxlGold
            case "roundXxs": return .roundXxsGold
            default: return nil
            }
        }
    }
}

