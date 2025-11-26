import Foundation
import SwiftUI
import SDDSThemeCore

public extension View {
    func subtheme(_ subthemeData: SubthemeData) -> some View {
        self
            .environment(\.subtheme, subthemeData)
    }
}
