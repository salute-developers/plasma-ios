import Foundation
import SwiftUI

public extension View {
    @ViewBuilder func applyIf<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func hiddenIf(_ condition: @autoclosure () -> Bool) -> some View {
        applyIf(condition(), transform: { $0.hidden() })
    }
    
    @ViewBuilder func apply<Content: View>(transform: (Self) -> Content) -> some View {
        transform(self)
    }
}

extension View {
    func environment(cellAppearance: CellAppearance) -> some View {
        self
            .environment(\.avatarAppearance, cellAppearance.avatarAppearance)
            .environment(\.buttonAppearance, cellAppearance.buttonAppearance)
            .environment(\.switchAppearance, cellAppearance.switchAppearance)
            .environment(\.checkboxAppearance, cellAppearance.checkboxAppearance)
            .environment(\.radioboxAppearance, cellAppearance.radioboxAppearance)
    }
}
