/* This file is code generated. */

import SwiftUI
import UIKit
@_exported import SDDSThemeCore


public extension Spacings {
    static func registerGold() {
        ThemeTenantRegistry.shared.registerSpacings(theme: "SDDSServ", tenant: Tenant(name: "Gold")) { id in
            switch id {
            case "spacing0x": return .spacing0xGold
            case "spacing10x": return .spacing10xGold
            case "spacing12x": return .spacing12xGold
            case "spacing16x": return .spacing16xGold
            case "spacing1x": return .spacing1xGold
            case "spacing20x": return .spacing20xGold
            case "spacing24x": return .spacing24xGold
            case "spacing2x": return .spacing2xGold
            case "spacing32x": return .spacing32xGold
            case "spacing3x": return .spacing3xGold
            case "spacing40x": return .spacing40xGold
            case "spacing4x": return .spacing4xGold
            case "spacing60x": return .spacing60xGold
            case "spacing6x": return .spacing6xGold
            case "spacing8x": return .spacing8xGold
            default: return nil
            }
        }
    }
}

