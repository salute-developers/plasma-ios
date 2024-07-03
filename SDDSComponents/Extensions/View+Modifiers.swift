import Foundation
import SwiftUI

extension View {
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
}
