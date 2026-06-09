/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore


public extension Shadows {
    static func registerGold() {
        ThemeTenantRegistry.shared.registerShadows(theme: "SDDSServ", tenant: Tenant(name: "Gold")) { id in
            switch id {
            case "downHardL": return .downHardLGold
            case "downHardM": return .downHardMGold
            case "downHardS": return .downHardSGold
            case "downSoftL": return .downSoftLGold
            case "downSoftM": return .downSoftMGold
            case "downSoftS": return .downSoftSGold
            default: return nil
            }
        }
    }
}

