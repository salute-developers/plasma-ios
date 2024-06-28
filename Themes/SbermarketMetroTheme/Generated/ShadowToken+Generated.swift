import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension ShadowToken {
    static var downHardL: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 7
            ),
            opacity: 0.24,
            radius: 7
        )
    }
    static var downHardM: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 4
            ),
            opacity: 0.2,
            radius: 3
        )
    }
    static var downHardS: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 2
            ),
            opacity: 0.15,
            radius: 1.5
        )
    }
    static var downSoftL: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 7
            ),
            opacity: 0.16,
            radius: 7
        )
    }
    static var downSoftM: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 4
            ),
            opacity: 0.1,
            radius: 3
        )
    }
    static var downSoftS: Self {
        Self(
            color: Color(UIColor(hex: "#000")),
            offset: Offset(
                width: 0,
                height: 2
            ),
            opacity: 0.08,
            radius: 1.5
        )
    }
}
